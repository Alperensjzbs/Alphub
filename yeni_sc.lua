<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Alperen'in kişisel web sitesi - Yazılım Geliştirici & Girişimci">
    <title>Alperen | Kişisel Web Sitesi</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <style>
        @impor url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap');
        
        :root {
            --primary: #6366f1;
        }
        
        body {
            font-family: 'Inter', system_ui, sans-serif;
        }
        
        .hero-bg {
            background: linear-gradient(135deg, #1e2937 0%, #0f172a 100%);
        }
        
        .nav-link {
            transition: all 0.3s ease;
        }
        
        .nav-link:hover {
            color: #6366f1;
            transform: translateY(-2px);
        }
        
        .section-title {
            position: relative;
        }
        
        .section-title:after {
            content: '';
            position: absolute;
            width: 60px;
            height: 3px;
            background: #6366f1;
            bottom: -8px;
            left: 0;
        }
        
        .card-hover {
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        }
        
        .card-hover:hover {
            transform: translateY(-12px);
            box-shadow: 0 25px 50px -12px rgb(99 102 241 / 0.25);
        }

        .modal {
            animation: modalPop 0.3s ease forwards;
        }
        
        @keyframes modalPop {
            0% { opacity: 0; transform: scale(0.95); }
            100% { opacity: 1; transform: scale(1); }
        }

        .progress-bar {
            transition: width 1.5s cubic-bezier(0.34, 1.56, 0.64, 1);
        }

        .blog-card {
            transition: all 0.4s ease;
        }
    </style>
</head>
<body class="bg-slate-950 text-slate-100">

    <!-- NAVBAR -->
    <nav class="bg-slate-950 border-b border-slate-800 sticky top-0 z-50">
        <div class="max-w-7xl mx-auto px-6 py-5 flex justify-between items-center">
            <div class="flex items-center gap-3">
                <div class="w-9 h-9 bg-indigo-600 rounded-2xl flex items-center justify-center text-white font-bold text-xl">A</div>
                <h1 class="text-2xl font-semibold tracking-tight">Alperen</h1>
            </div>
            
            <div class="hidden md:flex items-center gap-8 text-sm font-medium">
                <a href="#hakkimda" class="nav-link">Hakkımda</a>
                <a href="#yetenekler" class="nav-link">Yetenekler</a>
                <a href="#projeler" class="nav-link">Projeler</a>
                <a href="#deneyim" class="nav-link">Deneyim</a>
                <a href="#egitim" class="nav-link">Eğitim</a>
                <a href="#referanslar" class="nav-link">Referanslar</a>
                <a href="#blog" class="nav-link">Blog</a>
                <a href="#faq" class="nav-link">SSS</a>
                <a href="#iletisim" class="nav-link">İletişim</a>
            </div>
            
            <div class="flex items-center gap-4">
                <a href="#" onclick="downloadCV()" 
                   class="hidden md:flex items-center gap-2 px-5 py-2.5 border border-slate-600 hover:border-indigo-400 rounded-2xl text-sm font-medium transition-all">
                    <i class="fa-solid fa-download"></i>
                    CV İndir
                </a>
                
                <a href="#iletisim" 
                   class="px-6 py-3 bg-indigo-600 hover:bg-indigo-700 rounded-2xl font-semibold text-sm flex items-center gap-2 transition-colors">
                    <i class="fa-solid fa-paper-plane"></i>
                    Bana Ulaş
                </a>
                
                <button onclick="toggleMobileMenu()" class="md:hidden text-2xl">
                    <i class="fa-solid fa-bars"></i>
                </button>
            </div>
        </div>
        
        <!-- Mobil Menü -->
        <div id="mobileMenu" class="hidden md:hidden bg-slate-900 border-t border-slate-800 px-6 py-4">
            <div class="flex flex-col gap-4 text-sm font-medium">
                <a href="#hakkimda" onclick="toggleMobileMenu()" class="py-2">Hakkımda</a>
                <a href="#yetenekler" onclick="toggleMobileMenu()" class="py-2">Yetenekler</a>
                <a href="#projeler" onclick="toggleMobileMenu()" class="py-2">Projeler</a>
                <a href="#deneyim" onclick="toggleMobileMenu()" class="py-2">Deneyim</a>
                <a href="#egitim" onclick="toggleMobileMenu()" class="py-2">Eğitim</a>
                <a href="#referanslar" onclick="toggleMobileMenu()" class="py-2">Referanslar</a>
                <a href="#blog" onclick="toggleMobileMenu()" class="py-2">Blog</a>
                <a href="#faq" onclick="toggleMobileMenu()" class="py-2">SSS</a>
                <a href="#iletisim" onclick="toggleMobileMenu()" class="py-2">İletişim</a>
                <a href="#" onclick="downloadCV();toggleMobileMenu()" class="py-2 flex items-center gap-2">
                    <i class="fa-solid fa-download"></i> CV İndir (PDF)
                </a>
            </div>
        </div>
    </nav>

    <!-- HERO SECTION -->
    <header class="hero-bg min-h-screen flex items-center">
        <div class="max-w-7xl mx-auto px-6 grid md:grid-cols-2 gap-12 items-center">
            <div class="space-y-8">
                <div class="inline-flex items-center gap-2 bg-slate-900 border border-slate-700 rounded-3xl px-4 py-2 text-sm">
                    <div class="w-2 h-2 bg-emerald-500 rounded-full animate-pulse"></div>
                    İstanbul'dan selamlar 👋
                </div>
                
                <h1 class="text-6xl md:text-7xl font-bold leading-none tracking-tighter">
                    Merhaba, ben<br>
                    <span class="text-transparent bg-clip-text bg-gradient-to-r from-indigo-400 to-violet-400">Alperen</span>
                </h1>
                
                <p class="text-2xl text-slate-400 max-w-lg">
                    Yazılım geliştirici, ürün tasarımcısı ve tutkulu bir girişimci.<br>
                    Dijital dünyayı daha iyi bir yer haline getirmeye çalışıyorum.
                </p>
                
                <div class="flex items-center gap-4 flex-wrap">
                    <a href="#projeler" 
                       class="px-8 py-4 bg-white text-slate-900 hover:bg-amber-300 font-semibold rounded-3xl flex items-center gap-3 text-lg transition-all">
                        <i class="fa-solid fa-rocket"></i>
                        Projelerimi Gör
                    </a>
                    <a href="#iletisim" 
                       class="px-8 py-4 border border-slate-700 hover:border-slate-400 font-semibold rounded-3xl flex items-center gap-3 text-lg transition-all">
                        <i class="fa-solid fa-envelope"></i>
                        İletişime Geç
                    </a>
                    <a href="#" onclick="downloadCV()" 
                       class="px-8 py-4 bg-emerald-600 hover:bg-emerald-700 text-white font-semibold rounded-3xl flex items-center gap-3 text-lg transition-all">
                        <i class="fa-solid fa-download"></i>
                        CV İndir
                    </a>
                </div>
                
                <div class="grid grid-cols-3 gap-6 pt-8">
                    <div class="text-center">
                        <div id="counter-projects" class="text-emerald-400 text-5xl font-bold">15</div>
                        <div class="text-slate-400 text-sm mt-1">Tamamlanmış Proje</div>
                    </div>
                    <div class="text-center">
                        <div id="counter-countries" class="text-emerald-400 text-5xl font-bold">8</div>
                        <div class="text-slate-400 text-sm mt-1">Ülkede Çalıştım</div>
                    </div>
                    <div class="text-center">
                        <div id="counter-startups" class="text-emerald-400 text-5xl font-bold">4</div>
                        <div class="text-slate-400 text-sm mt-1">Startup Kurucusu</div>
                    </div>
                </div>
                
                <div class="flex gap-6 text-2xl">
                    <a href="#" class="hover:text-indigo-400 transition-colors"><i class="fa-brands fa-linkedin"></i></a>
                    <a href="#" class="hover:text-indigo-400 transition-colors"><i class="fa-brands fa-github"></i></a>
                    <a href="#" class="hover:text-indigo-400 transition-colors"><i class="fa-brands fa-x-twitter"></i></a>
                    <a href="#" class="hover:text-indigo-400 transition-colors"><i class="fa-brands fa-instagram"></i></a>
                    <a href="#" class="hover:text-indigo-400 transition-colors"><i class="fa-brands fa-youtube"></i></a>
                </div>
            </div>
            
            <div class="flex justify-center">
                <div class="relative">
                    <div class="w-80 h-80 md:w-96 md:h-96 bg-gradient-to-br from-indigo-500 to-violet-500 rounded-3xl rotate-6 p-3 shadow-2xl">
                        <img src="https://picsum.photos/id/1011/800/800" 
                             alt="Alperen - Profil Fotoğrafı"
                             class="w-full h-full object-cover rounded-3xl -rotate-6 shadow-xl">
                    </div>
                    <div class="absolute -bottom-4 -right-4 bg-slate-900 border border-slate-700 rounded-2xl px-6 py-4 shadow-xl flex items-center gap-3">
                        <div class="text-emerald-400">
                            <i class="fa-solid fa-circle-check text-3xl"></i>
                        </div>
                        <div>
                            <p class="font-semibold">Şu anda açık</p>
                            <p class="text-sm text-slate-400">Yeni projeler için hazırım</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- HAKKIMDA -->
    <section id="hakkimda" class="max-w-7xl mx-auto px-6 py-24">
        <div class="grid md:grid-cols-12 gap-16">
            <div class="md:col-span-5">
                <span class="uppercase text-indigo-400 text-sm tracking-[2px] font-medium">01 — TANITIM</span>
                <h2 class="section-title text-5xl font-semibold mt-3">Hakkımda</h2>
                <p class="text-slate-400 mt-6 text-lg leading-relaxed">
                    Merhaba! Ben Alperen. 5+ yıldır yazılım geliştirme alanında çalışıyorum. 
                    Özellikle web teknolojileri, mobil uygulamalar ve yapay zeka üzerine odaklanıyorum.
                </p>
                <p class="text-slate-400 mt-6 text-lg leading-relaxed">
                    İstanbul’da yaşıyorum. Boş zamanlarımda yeni teknolojiler öğreniyor, açık kaynak projelere katkıda bulunuyor ve kahve içiyorum ☕
                </p>
                
                <div class="mt-10">
                    <h4 class="font-semibold text-lg mb-4">Hobilerim &amp; İlgi Alanlarım</h4>
                    <div class="flex flex-wrap gap-3">
                        <span class="bg-slate-900 text-slate-300 px-5 py-2 rounded-3xl text-sm flex items-center gap-2"><i class="fa-solid fa-book"></i> Bilim kurgu kitapları</span>
                        <span class="bg-slate-900 text-slate-300 px-5 py-2 rounded-3xl text-sm flex items-center gap-2"><i class="fa-solid fa-mountain"></i> Doğa yürüyüşü</span>
                        <span class="bg-slate-900 text-slate-300 px-5 py-2 rounded-3xl text-sm flex items-center gap-2"><i class="fa-solid fa-camera"></i> Fotoğrafçılık</span>
                        <span class="bg-slate-900 text-slate-300 px-5 py-2 rounded-3xl text-sm flex items-center gap-2"><i class="fa-solid fa-chess"></i> Satranç</span>
                        <span class="bg-slate-900 text-slate-300 px-5 py-2 rounded-3xl text-sm flex items-center gap-2"><i class="fa-solid fa-music"></i> Indie müzik</span>
                    </div>
                </div>
            </div>
            
            <div class="md:col-span-7 bg-slate-900 rounded-3xl p-10">
                <h3 class="text-2xl font-semibold mb-8">Kısa Hikayem</h3>
                <div class="space-y-8 text-slate-300">
                    <div class="flex gap-6">
                        <div class="w-12 h-12 bg-indigo-100 text-indigo-600 rounded-2xl flex-shrink-0 flex items-center justify-center font-bold">2023</div>
                        <div>
                            <p class="font-medium">Kendi startup’ımı kurdum</p>
                            <p class="text-sm text-slate-400">Yapay zeka tabanlı içerik aracı geliştirdik. 2 yılda 120.000+ kullanıcıya ulaştık.</p>
                        </div>
                    </div>
                    <div class="flex gap-6">
                        <div class="w-12 h-12 bg-indigo-100 text-indigo-600 rounded-2xl flex-shrink-0 flex items-center justify-center font-bold">2021</div>
                        <div>
                            <p class="font-medium">Global bir şirkette Senior Developer oldum</p>
                            <p class="text-sm text-slate-400">Remote olarak Avrupa ve Amerika’daki projelerde yer aldım.</p>
                        </div>
                    </div>
                    <div class="flex gap-6">
                        <div class="w-12 h-12 bg-indigo-100 text-indigo-600 rounded-2xl flex-shrink-0 flex items-center justify-center font-bold">2019</div>
                        <div>
                            <p class="font-medium">Yazılım dünyasına adım attım</p>
                            <p class="text-sm text-slate-400">İlk projemi 19 yaşımda tamamladım. O günden beri durmadım.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- YETENEKLER (şimdi progress bar'lı) -->
    <section id="yetenekler" class="bg-slate-900 py-24">
        <div class="max-w-7xl mx-auto px-6">
            <div class="text-center mb-16">
                <span class="uppercase text-indigo-400 text-sm tracking-[2px]">02 — YETENEKLER</span>
                <h2 class="section-title text-5xl font-semibold mt-3 mx-auto inline-block">Ne Yapabiliyorum?</h2>
            </div>
            
            <div class="grid grid-cols-1 md:grid-cols-2 gap-x-16 gap-y-10">
                <div>
                    <div class="flex justify-between mb-2 text-sm"><span>React / Next.js</span><span class="font-medium">95%</span></div>
                    <div class="h-2 bg-slate-800 rounded-3xl overflow-hidden"><div class="progress-bar h-2 bg-cyan-400 w-0" style="width:95%"></div></div>
                </div>
                <div>
                    <div class="flex justify-between mb-2 text-sm"><span>Node.js &amp; Express</span><span class="font-medium">88%</span></div>
                    <div class="h-2 bg-slate-800 rounded-3xl overflow-hidden"><div class="progress-bar h-2 bg-emerald-400 w-0" style="width:88%"></div></div>
                </div>
                <div>
                    <div class="flex justify-between mb-2 text-sm"><span>React Native</span><span class="font-medium">82%</span></div>
                    <div class="h-2 bg-slate-800 rounded-3xl overflow-hidden"><div class="progress-bar h-2 bg-blue-400 w-0" style="width:82%"></div></div>
                </div>
                <div>
                    <div class="flex justify-between mb-2 text-sm"><span>Yapay Zeka / LLM</span><span class="font-medium">90%</span></div>
                    <div class="h-2 bg-slate-800 rounded-3xl overflow-hidden"><div class="progress-bar h-2 bg-violet-400 w-0" style="width:90%"></div></div>
                </div>
                <div>
                    <div class="flex justify-between mb-2 text-sm"><span>UI/UX (Figma)</span><span class="font-medium">85%</span></div>
                    <div class="h-2 bg-slate-800 rounded-3xl overflow-hidden"><div class="progress-bar h-2 bg-pink-400 w-0" style="width:85%"></div></div>
                </div>
                <div>
                    <div class="flex justify-between mb-2 text-sm"><span>Veritabanı (PostgreSQL, Mongo)</span><span class="font-medium">87%</span></div>
                    <div class="h-2 bg-slate-800 rounded-3xl overflow-hidden"><div class="progress-bar h-2 bg-orange-400 w-0" style="width:87%"></div></div>
                </div>
            </div>
        </div>
    </section>

    <!-- PROJELER + MODALLAR -->
    <section id="projeler" class="max-w-7xl mx-auto px-6 py-24">
        <div class="text-center mb-16">
            <span class="uppercase text-indigo-400 text-sm tracking-[2px]">03 — PROJELER</span>
            <h2 class="section-title text-5xl font-semibold mt-3 mx-auto inline-block">Son Çalışmalarım</h2>
        </div>
        
        <div class="grid md:grid-cols-3 gap-8">
            <!-- Proje 1 -->
            <div onclick="showProjectModal(1)" class="bg-slate-900 rounded-3xl overflow-hidden card-hover cursor-pointer">
                <img src="https://picsum.photos/id/1015/800/600" alt="AI Content Studio" class="w-full h-64 object-cover">
                <div class="p-8">
                    <div class="flex justify-between items-center mb-4">
                        <span class="text-xs uppercase bg-emerald-400 text-slate-900 px-3 py-1 rounded-full font-bold">AI</span>
                        <span class="text-slate-400 text-sm">2025</span>
                    </div>
                    <h3 class="text-2xl font-semibold">AI Content Studio</h3>
                    <p class="text-slate-400 mt-3">Yapay zeka ile saniyeler içinde profesyonel içerik üreten platform.</p>
                    <div class="mt-8 text-indigo-400 hover:text-indigo-300 flex items-center gap-2 text-sm font-medium">
                        Detaylı İncele <i class="fa-solid fa-arrow-right"></i>
                    </div>
                </div>
            </div>
            
            <!-- Proje 2 -->
            <div onclick="showProjectModal(2)" class="bg-slate-900 rounded-3xl overflow-hidden card-hover cursor-pointer">
                <img src="https://picsum.photos/id/201/800/600" alt="Decentralized Freelance" class="w-full h-64 object-cover">
                <div class="p-8">
                    <div class="flex justify-between items-center mb-4">
                        <span class="text-xs uppercase bg-blue-400 text-slate-900 px-3 py-1 rounded-full font-bold">Web3</span>
                        <span class="text-slate-400 text-sm">2024</span>
                    </div>
                    <h3 class="text-2xl font-semibold">Decentralized Freelance</h3>
                    <p class="text-slate-400 mt-3">Kripto ile ödeme alan, akıllı kontratlı freelance platformu.</p>
                    <div class="mt-8 text-indigo-400 hover:text-indigo-300 flex items-center gap-2 text-sm font-medium">
                        Detaylı İncele <i class="fa-solid fa-arrow-right"></i>
                    </div>
                </div>
            </div>
            
            <!-- Proje 3 -->
            <div onclick="showProjectModal(3)" class="bg-slate-900 rounded-3xl overflow-hidden card-hover cursor-pointer">
                <img src="https://picsum.photos/id/870/800/600" alt="HabitFlow App" class="w-full h-64 object-cover">
                <div class="p-8">
                    <div class="flex justify-between items-center mb-4">
                        <span class="text-xs uppercase bg-amber-400 text-slate-900 px-3 py-1 rounded-full font-bold">Mobile</span>
                        <span class="text-slate-400 text-sm">2024</span>
                    </div>
                    <h3 class="text-2xl font-semibold">HabitFlow App</h3>
                    <p class="text-slate-400 mt-3">Günlük alışkanlıkları takip eden, motivasyon odaklı mobil uygulama.</p>
                    <div class="mt-8 text-indigo-400 hover:text-indigo-300 flex items-center gap-2 text-sm font-medium">
                        Detaylı İncele <i class="fa-solid fa-arrow-right"></i>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- PROJE MODALLARI -->
    <div id="modal1" onclick="if(event.target.id === 'modal1') hideAllModals()" class="hidden fixed inset-0 bg-black/80 z-[9999] flex items-center justify-center p-4">
        <div onclick="event.stopImmediatePropagation()" class="modal bg-slate-900 max-w-3xl w-full rounded-3xl overflow-hidden">
            <div class="p-8 border-b border-slate-700 flex justify-between items-center">
                <h2 class="text-3xl font-semibold">AI Content Studio</h2>
                <button onclick="hideAllModals()" class="text-3xl text-slate-400 hover:text-white">×</button>
            </div>
            <div class="p-8">
                <img src="https://picsum.photos/id/1015/1200/600" alt="AI Content Studio Screenshot" class="w-full rounded-2xl mb-8">
                <div class="grid md:grid-cols-3 gap-6 mb-10">
                    <div><strong>Teknolojiler:</strong> Next.js, OpenAI, Tailwind, Supabase</div>
                    <div><strong>Kullanıcı Sayısı:</strong> 120.000+</div>
                    <div><strong>Özellikler:</strong> Metin → Video, Ses → İçerik, Otomatik SEO</div>
                </div>
                <p class="text-slate-300 leading-relaxed">Yapay zeka ile profesyonel içerik üreten tam entegre platform. Kullanıcılar saniyeler içinde blog yazısı, sosyal medya postu, video scripti ve daha fazlasını oluşturabiliyor. Benim ilk startup’ım ve hâlâ aktif olarak geliştiriyorum.</p>
            </div>
            <div class="p-8 border-t border-slate-700 flex justify-end gap-4">
                <a href="#" class="px-8 py-4 bg-slate-800 rounded-2xl">Canlı Demo</a>
                <a href="#" class="px-8 py-4 bg-indigo-600 rounded-2xl">GitHub’da İncele</a>
            </div>
        </div>
    </div>

    <div id="modal2" onclick="if(event.target.id === 'modal2') hideAllModals()" class="hidden fixed inset-0 bg-black/80 z-[9999] flex items-center justify-center p-4">
        <div onclick="event.stopImmediatePropagation()" class="modal bg-slate-900 max-w-3xl w-full rounded-3xl overflow-hidden">
            <div class="p-8 border-b border-slate-700 flex justify-between items-center">
                <h2 class="text-3xl font-semibold">Decentralized Freelance</h2>
                <button onclick="hideAllModals()" class="text-3xl text-slate-400 hover:text-white">×</button>
            </div>
            <div class="p-8">
                <img src="https://picsum.photos/id/201/1200/600" alt="Decentralized Freelance Screenshot" class="w-full rounded-2xl mb-8">
                <div class="grid md:grid-cols-3 gap-6 mb-10">
                    <div><strong>Teknolojiler:</strong> Solidity, Next.js, Web3.js, Polygon</div>
                    <div><strong>Özellikler:</strong> Akıllı kontratlı ödeme, DAO yönetimi</div>
                    <div><strong>Durum:</strong> Beta aşamasında</div>
                </div>
                <p class="text-slate-300 leading-relaxed">Geleneksel freelance platformlarının Web3 versiyonu. Hiçbir aracı olmadan, kripto ile ödeme alıyorsun ve tüm sözleşmeler blockchain üzerinde.</p>
            </div>
            <div class="p-8 border-t border-slate-700 flex justify-end gap-4">
                <a href="#" class="px-8 py-4 bg-slate-800 rounded-2xl">Canlı Demo</a>
                <a href="#" class="px-8 py-4 bg-indigo-600 rounded-2xl">GitHub’da İncele</a>
            </div>
        </div>
    </div>

    <div id="modal3" onclick="if(event.target.id === 'modal3') hideAllModals()" class="hidden fixed inset-0 bg-black/80 z-[9999] flex items-center justify-center p-4">
        <div onclick="event.stopImmediatePropagation()" class="modal bg-slate-900 max-w-3xl w-full rounded-3xl overflow-hidden">
            <div class="p-8 border-b border-slate-700 flex justify-between items-center">
                <h2 class="text-3xl font-semibold">HabitFlow App</h2>
                <button onclick="hideAllModals()" class="text-3xl text-slate-400 hover:text-white">×</button>
            </div>
            <div class="p-8">
                <img src="https://picsum.photos/id/870/1200/600" alt="HabitFlow App Screenshot" class="w-full rounded-2xl mb-8">
                <div class="grid md:grid-cols-3 gap-6 mb-10">
                    <div><strong>Teknolojiler:</strong> React Native, Firebase, Expo</div>
                    <div><strong>İndirme:</strong> 45.000+</div>
                    <div><strong>Özellikler:</strong> AI motivasyon koçu, streak sistemi</div>
                </div>
                <p class="text-slate-300 leading-relaxed">Günlük alışkanlık takibi yapan, gamification ve yapay zeka destekli mobil uygulama. Kullanıcılar %340 daha fazla alışkanlık oluşturuyor.</p>
            </div>
            <div class="p-8 border-t border-slate-700 flex justify-end gap-4">
                <a href="#" class="px-8 py-4 bg-slate-800 rounded-2xl">App Store</a>
                <a href="#" class="px-8 py-4 bg-indigo-600 rounded-2xl">Play Store</a>
            </div>
        </div>
    </div>

    <!-- DENEYİM -->
    <section id="deneyim" class="bg-slate-900 py-24">
        <div class="max-w-7xl mx-auto px-6">
            <div class="text-center mb-16">
                <span class="uppercase text-indigo-400 text-sm tracking-[2px]">04 — DENEYİM</span>
                <h2 class="section-title text-5xl font-semibold mt-3 mx-auto inline-block">Yolculuğum</h2>
            </div>
            
            <div class="space-y-12 max-w-3xl mx-auto">
                <div class="flex gap-8">
                    <div class="text-right w-36 shrink-0">
                        <div class="text-emerald-400 font-semibold">2024 - Devam</div>
                        <div class="text-sm text-slate-400">Şu anda</div>
                    </div>
                    <div class="flex-1">
                        <div class="bg-slate-800 rounded-3xl p-8">
                            <h4 class="font-semibold text-xl">Freelance Yazılım Danışmanı</h4>
                            <p class="text-indigo-400">Kendi şirketim</p>
                            <p class="mt-4 text-slate-300">10+ startup’a teknik danışmanlık verdim. Next.js ve AI entegrasyonları üzerine odaklandım.</p>
                        </div>
                    </div>
                </div>
                
                <div class="flex gap-8">
                    <div class="text-right w-36 shrink-0">
                        <div class="text-emerald-400 font-semibold">2022 - 2024</div>
                        <div class="text-sm text-slate-400">2 yıl</div>
                    </div>
                    <div class="flex-1">
                        <div class="bg-slate-800 rounded-3xl p-8">
                            <h4 class="font-semibold text-xl">Senior Full Stack Developer</h4>
                            <p class="text-indigo-400">Remote • Berlin merkezli SaaS şirketi</p>
                            <p class="mt-4 text-slate-300">Ekip lideri olarak 8 kişilik takımı yönettim. Aylık 2 milyon kullanıcıya hizmet verdik.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- EĞİTİM -->
    <section id="egitim" class="max-w-7xl mx-auto px-6 py-24">
        <div class="text-center mb-16">
            <span class="uppercase text-indigo-400 text-sm tracking-[2px]">05 — EĞİTİM</span>
            <h2 class="section-title text-5xl font-semibold mt-3 mx-auto inline-block">Öğrenme Yolculuğum</h2>
        </div>
        
        <div class="grid md:grid-cols-2 gap-8 max-w-4xl mx-auto">
            <div class="bg-slate-900 rounded-3xl p-8 card-hover">
                <div class="flex justify-between items-start">
                    <div>
                        <h3 class="text-2xl font-semibold">Bilgisayar Mühendisliği</h3>
                        <p class="text-indigo-400">Boğaziçi Üniversitesi • İstanbul</p>
                    </div>
                    <div class="text-right text-sm text-slate-400">
                        2017 — 2021<br>
                        <span class="bg-emerald-400 text-slate-900 px-3 py-1 rounded-2xl text-xs font-bold">Mezun</span>
                    </div>
                </div>
                <p class="mt-6 text-slate-400">Lisans derecesi. Tez konusu: "Derin Öğrenme ile Gerçek Zamanlı Nesne Tespiti".</p>
                <div class="mt-8 text-xs uppercase flex items-center gap-2 text-slate-400">
                    <i class="fa-solid fa-trophy"></i>
                    En İyi Tez Ödülü • 2021
                </div>
            </div>
            
            <div class="bg-slate-900 rounded-3xl p-8 card-hover">
                <div class="flex justify-between items-start">
                    <div>
                        <h3 class="text-2xl font-semibold">Yapay Zeka ve Makine Öğrenmesi</h3>
                        <p class="text-indigo-400">Coursera • Stanford University</p>
                    </div>
                    <div class="text-right text-sm text-slate-400">
                        2023 — 2024<br>
                        <span class="bg-amber-400 text-slate-900 px-3 py-1 rounded-2xl text-xs font-bold">Sertifika</span>
                    </div>
                </div>
                <p class="mt-6 text-slate-400">Andrew Ng’nin ünlü kursu + 3 ek sertifika (LLM, Prompt Engineering, Computer Vision).</p>
            </div>
        </div>
    </section>

    <!-- REFERANSLAR -->
    <section id="referanslar" class="bg-slate-900 py-24">
        <div class="max-w-7xl mx-auto px-6">
            <div class="text-center mb-16">
                <span class="uppercase text-indigo-400 text-sm tracking-[2px]">06 — REFERANSLAR</span>
                <h2 class="section-title text-5xl font-semibold mt-3 mx-auto inline-block">Bana Ne Diyorlar?</h2>
            </div>
            
            <div class="grid md:grid-cols-3 gap-8">
                <div class="bg-slate-800 rounded-3xl p-8 testimonial-card">
                    <div class="flex gap-3 mb-6">
                        <div class="w-10 h-10 bg-orange-400 rounded-2xl flex items-center justify-center text-white text-xl">🧑‍💼</div>
                        <div>
                            <p class="font-semibold">Mehmet Can</p>
                            <p class="text-xs text-slate-400">CTO @ TechFlow Startup</p>
                        </div>
                    </div>
                    <p class="italic text-slate-300">"Alperen ile çalışmak bir zevkti. AI projemizi 3 ayda hayata geçirdi. Hem teknik hem de vizyon olarak çok güçlü."</p>
                    <div class="text-amber-400 mt-8">★★★★★</div>
                </div>
                <div class="bg-slate-800 rounded-3xl p-8 testimonial-card">
                    <div class="flex gap-3 mb-6">
                        <div class="w-10 h-10 bg-purple-400 rounded-2xl flex items-center justify-center text-white text-xl">👩‍💻</div>
                        <div>
                            <p class="font-semibold">Elif Demir</p>
                            <p class="text-xs text-slate-400">Kurucu Ortak @ HabitFlow</p>
                        </div>
                    </div>
                    <p class="italic text-slate-300">"Mobil uygulamamızı sıfırdan tasarladı ve geliştirdi. Kullanıcılarımız %340 arttı. Tavsiye ederim!"</p>
                    <div class="text-amber-400 mt-8">★★★★★</div>
                </div>
                <div class="bg-slate-800 rounded-3xl p-8 testimonial-card">
                    <div class="flex gap-3 mb-6">
                        <div class="w-10 h-10 bg-cyan-400 rounded-2xl flex items-center justify-center text-white text-xl">🧔</div>
                        <div>
                            <p class="font-semibold">Dr. Ahmet Kaya</p>
                            <p class="text-xs text-slate-400">Profesör • Boğaziçi Üni.</p>
                        </div>
                    </div>
                    <p class="italic text-slate-300">"Tez sürecinde mentörlüğünü yaptım. Olağanüstü bir öğrenci ve şimdi de harika bir profesyonel."</p>
                    <div class="text-amber-400 mt-8">★★★★★</div>
                </div>
            </div>
        </div>
    </section>

    <!-- YENİ: BLOG -->
    <section id="blog" class="max-w-7xl mx-auto px-6 py-24">
        <div class="text-center mb-16">
            <span class="uppercase text-indigo-400 text-sm tracking-[2px]">07 — BLOG</span>
            <h2 class="section-title text-5xl font-semibold mt-3 mx-auto inline-block">Son Yazılarım</h2>
        </div>
        
        <div class="grid md:grid-cols-3 gap-8">
            <div onclick="alert('Bu yazıya tıklandı! (Gerçek projede link ekleyebilirsin)')" class="blog-card bg-slate-900 rounded-3xl p-6 cursor-pointer">
                <div class="text-emerald-400 text-xs mb-3">12 Nisan 2026 • 8 dk okuma</div>
                <h3 class="text-xl font-semibold mb-3">2026’da LLM’ler ile Gerçek Zamanlı AI Agent’lar Nasıl İnşa Edilir?</h3>
                <p class="text-slate-400">Next.js + LangChain + Vercel AI SDK ile sıfırdan AI agent kurma rehberi.</p>
            </div>
            <div onclick="alert('Bu yazıya tıklandı! (Gerçek projede link ekleyebilirsin)')" class="blog-card bg-slate-900 rounded-3xl p-6 cursor-pointer">
                <div class="text-emerald-400 text-xs mb-3">5 Nisan 2026 • 6 dk okuma</div>
                <h3 class="text-xl font-semibold mb-3">Web3 Freelance Platformu Kurmak: Tam Rehber</h3>
                <p class="text-slate-400">Solidity kontratları, frontend entegrasyonu ve pazarlama taktikleri.</p>
            </div>
            <div onclick="alert('Bu yazıya tıklandı! (Gerçek projede link ekleyebilirsin)')" class="blog-card bg-slate-900 rounded-3xl p-6 cursor-pointer">
                <div class="text-emerald-400 text-xs mb-3">28 Mart 2026 • 10 dk okuma</div>
                <h3 class="text-xl font-semibold mb-3">HabitFlow’un Büyüme Hikayesi: 0’dan 45.000 Kullanıcıya</h3>
                <p class="text-slate-400">Product-market fit bulma, viral loop’lar ve retention taktikleri.</p>
            </div>
        </div>
    </section>

    <!-- YENİ: SSS (FAQ) -->
    <section id="faq" class="bg-slate-900 py-24">
        <div class="max-w-3xl mx-auto px-6">
            <div class="text-center mb-16">
                <span class="uppercase text-indigo-400 text-sm tracking-[2px]">08 — SSS</span>
                <h2 class="section-title text-5xl font-semibold mt-3 mx-auto inline-block">Sık Sorulan Sorular</h2>
            </div>
            
            <div class="space-y-4">
                **Summary:**

                        Freelance iş alıyor musun?
                        <span class="text-2xl group-open:rotate-45 transition-transform">+</span>
                    
                    <p class="mt-4 text-slate-400">Evet! Özellikle AI entegrasyonu, Next.js projeleri ve mobil uygulamalar için açık durumdayım. Detaylı teklif için iletişime geç.</p>
                **Summary:**

                        Hangi şehirde çalışıyorsun?
                        <span class="text-2xl group-open:rotate-45 transition-transform">+</span>
                    
                    <p class="mt-4 text-slate-400">İstanbul merkezliyim ama tamamen remote çalışıyorum. Dünyanın her yerinden projeler alıyorum.</p>
                **Summary:**

                        Açık kaynak projelere katkı veriyor musun?
                        <span class="text-2xl group-open:rotate-45 transition-transform">+</span>
                    
                    <p class="mt-4 text-slate-400">Evet! GitHub profilimde 12+ açık kaynak projeye katkı verdim. İstersen linkini paylaşayım.</p>
            </div>
        </div>
    </section>

    <!-- İLETİŞİM -->
    <section id="iletisim" class="max-w-7xl mx-auto px-6 py-24">
        <div class="grid md:grid-cols-2 gap-16 items-center">
            <div>
                <span class="uppercase text-indigo-400 text-sm tracking-[2px]">09 — İLETİŞİM</span>
                <h2 class="section-title text-5xl font-semibold mt-3">Birlikte çalışalım!</h2>
                <p class="text-slate-400 text-xl mt-6">Yeni bir proje, iş teklifi ya da sadece sohbet etmek istersen bana ulaşabilirsin.</p>
                
                <div class="mt-12 space-y-6">
                    <a href="mailto:alperen@email.com" class="flex items-center gap-6 group">
                        <div class="w-14 h-14 bg-slate-900 rounded-2xl flex items-center justify-center text-3xl group-hover:bg-indigo-600 transition-colors">✉️</div>
                        <div>
                            <p class="font-medium text-lg">alperen@email.com</p>
                            <p class="text-slate-400">Hemen cevap veriyorum</p>
                        </div>
                    </a>
                    <a href="https://wa.me/905551234567" target="_blank" class="flex items-center gap-6 group">
                        <div class="w-14 h-14 bg-slate-900 rounded-2xl flex items-center justify-center text-3xl group-hover:bg-emerald-600 transition-colors">
                            <i class="fa-brands fa-whatsapp"></i>
                        </div>
                        <div>
                            <p class="font-medium text-lg">WhatsApp: +90 555 123 45 67</p>
                            <p class="text-slate-400">Her zaman açık</p>
                        </div>
                    </a>
                </div>
            </div>
            
            <form class="bg-slate-900 rounded-3xl p-10 space-y-6" onsubmit="handleSubmit(event)">
                <div>
                    <label class="block text-sm text-slate-400 mb-2">Adın Soyadın</label>
                    <input type="text" id="name" class="w-full bg-slate-800 border border-transparent focus:border-indigo-400 rounded-2xl px-6 py-5 outline-none transition-colors" placeholder="Alperen Yılmaz" required>
                </div>
                <div>
                    <label class="block text-sm text-slate-400 mb-2">E-posta Adresin</label>
                    <input type="email" id="email" class="w-full bg-slate-800 border border-transparent focus:border-indigo-400 rounded-2xl px-6 py-5 outline-none transition-colors" placeholder="ornek@email.com" required>
                </div>
                <div>
                    <label class="block text-sm text-slate-400 mb-2">Mesajın</label>
                    <textarea id="message" rows="5" class="w-full bg-slate-800 border border-transparent focus:border-indigo-400 rounded-3xl px-6 py-5 outline-none resize-none transition-colors" placeholder="Merhaba Alperen, birlikte bir proje yapalım mı?"></textarea>
                </div>
                <button type="submit" class="w-full bg-indigo-600 hover:bg-indigo-700 py-6 text-lg font-semibold rounded-3xl transition-all flex items-center justify-center gap-3">
                    <span>Mesaj Gönder</span>
                    <i class="fa-solid fa-paper-plane"></i>
                </button>
            </form>
        </div>
    </section>

    <!-- FOOTER -->
    <footer class="bg-black py-12 border-t border-slate-800">
        <div class="max-w-7xl mx-auto px-6">
            <div class="flex flex-col md:flex-row justify-between items-center gap-6">
                <div class="text-slate-400 text-sm">
                    © 2026 Alperen. Tüm hakları saklıdır.<br>
                    Bu şablonu tamamen ücretsiz kullanabilir, istediğin gibi kişiselleştirebilirsin.
                </div>
                <div class="flex gap-8 text-sm text-slate-400">
                    <a href="#" class="hover:text-white">Gizlilik</a>
                    <a href="#" class="hover:text-white">KVKK</a>
                    <a href="#" class="hover:text-white">LinkedIn</a>
                    <a href="#" class="hover:text-white">GitHub</a>
                </div>
                <div onclick="window.location.reload()" class="cursor-pointer text-xs flex items-center gap-2 text-slate-500 hover:text-slate-300">
                    <i class="fa-solid fa-rotate"></i>
                    Sayfayı Yenile
                </div>
            </div>
        </div>
    </footer>

    <script>
        // Tailwind
        function initializeTailwind() {
            tailwind.config = { content: [], theme: { extend: {} } }
        }
        
        // Mobil menü
        function toggleMobileMenu() {
            const menu = document.getElementById('mobileMenu')
            menu.classList.toggle('hidden')
        }
        
        // CV İndir
        function downloadCV() {
            const link = document.createElement('a')
            link.href = 'https://picsum.photos/id/1015/800/600' // Gerçek PDF linkini buraya koy
            link.download = 'Alperen_CV.pdf'
            link.click()
            alert('✅ CV indiriliyor... (Gerçek projede kendi PDF dosyanı koy!)')
        }
        
        // Form
        function handleSubmit(e) {
            e.preventDefault()
            alert('✅ Mesajın alındı! En kısa sürede cevap vereceğim. Teşekkürler!')
            e.target.reset()
        }
        
        // Counter animasyonu
        function animateCounters() {
            const counters = [
                { id: 'counter-projects', target: 15 },
                { id: 'counter-countries', target: 8 },
                { id: 'counter-startups', target: 4 }
            ]
            counters.forEach(counter => {
                const el = document.getElementById(counter.id)
                let count = 0
                const increment = Math.ceil(counter.target / 30)
                const timer = setInterval(() => {
                    count += increment
                    if (count >= counter.target) {
                        count = counter.target
                        clearInterval(timer)
                    }
                    el.textContent = count
                }, 40)
            })
        }
        
        // MODAL FONKSİYONLARI
        function showProjectModal(id) {
            document.getElementById('modal' + id).classList.remove('hidden')
            document.getElementById('modal' + id).classList.add('flex')
        }
        
        function hideAllModals() {
            const modals = document.querySelectorAll('.fixed.inset-0')
            modals.forEach(modal => {
                modal.classList.add('hidden')
                modal.classList.remove('flex')
            })
        }
        
        // Sayfa yüklendiğinde
        window.onload = function() {
            initializeTailwind()
            animateCounters()
            console.log('%c✅ Kişisel web sitesi şablonu (bayağı geliştirilmiş versiyon) yüklendi! 🎉', 'color:#6366f1; font-family:monospace; font-size:14px')
            
            // Smooth scroll
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    const target = document.querySelector(this.getAttribute('href'))
                    if (target) {
                        e.preventDefault()
                        target.scrollIntoView({ behavior: 'smooth', block: 'start' })
                    }
                })
            })
        }
    </script>
</body>
</html>