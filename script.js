'use strict';
const $ = (selector) => document.querySelector(selector);
const cfg = window.ELECTRIC_CONFIG || {};
const configured = /^https:\/\/.+\.supabase\.co\/?$/.test(cfg.supabaseUrl || '') && !!cfg.supabaseAnonKey && !cfg.supabaseAnonKey.startsWith('YOUR_');
const db = configured && window.supabase ? window.supabase.createClient(cfg.supabaseUrl, cfg.supabaseAnonKey) : null;
const menu = $('#menu');
if(menu) menu.addEventListener('click',()=>$('#navlinks').classList.toggle('open'));
document.querySelectorAll('#navlinks a').forEach(a=>a.addEventListener('click',()=>$('#navlinks')?.classList.remove('open')));
if($('#year')) $('#year').textContent = new Date().getFullYear();
const observer = 'IntersectionObserver' in window ? new IntersectionObserver((entries)=>entries.forEach(entry=>{if(entry.isIntersecting){entry.target.classList.add('visible');observer.unobserve(entry.target)}}),{threshold:.08}) : null;
document.querySelectorAll('.reveal').forEach(el=>observer?observer.observe(el):el.classList.add('visible'));
document.querySelectorAll('.filter').forEach(button=>button.addEventListener('click',()=>{document.querySelectorAll('.filter').forEach(b=>b.classList.toggle('active',b===button));document.querySelectorAll('.vehicle').forEach(card=>{card.hidden=button.dataset.filter!=='all' && card.dataset.category!==button.dataset.filter})}));
const form = $('#registrationForm');
if(form) form.addEventListener('submit',async(event)=>{
 event.preventDefault();const msg=$('#formMessage');const submit=$('#submitBtn');msg.className='form-message';
 if(!db){msg.textContent='Registration is not yet connected. The site owner needs to complete the Supabase setup.';msg.classList.add('error');return}
 if(!$('#consent').checked){msg.textContent='Please agree to be contacted.';msg.classList.add('error');return}
 submit.disabled=true;submit.textContent='Submitting…';
 const payload={full_name:$('#fullName').value.trim(),email:$('#email').value.trim().toLowerCase(),country:$('#country').value.trim(),interest:$('#interest').value,consented:true};
 try{const {error}=await db.from('registrations').insert(payload);if(error)throw error;form.reset();msg.textContent='You’re registered! Thanks for joining the revolution.';msg.classList.add('success')}
 catch(err){msg.textContent='Registration could not be completed. Please try again later.';msg.classList.add('error');console.error('Registration failed:',err.message)}
 finally{submit.disabled=false;submit.innerHTML='Register my interest <span>↗</span>'}
});
