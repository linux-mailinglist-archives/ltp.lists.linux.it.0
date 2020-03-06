Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F3417BCE7
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 13:37:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 453663C63D0
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 13:37:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 891A03C0515
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 13:37:07 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 0B88E600804
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 13:37:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583498225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fkfcpdsT0gm1iIjkC0UtGnqwQhl40uwt21rc6PcooJs=;
 b=Ojys3YyDR8db5y/2FAP5UEWrx7p2QSmR+VxxauSmnVaCl6F/E+4ujVRZYganCubzyWaCKy
 6GV25x9Y492GMBWXtw7dSJYVcfd0dzsxuHI/HFXmH/dx7lY//qBrWQp3XGXy1cv7aOEr7X
 o5YoTghf4UtfQn+B14QEhniNWLqRa4I=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-kEv4A1vFMNCxaKtGf3u9bw-1; Fri, 06 Mar 2020 07:37:03 -0500
X-MC-Unique: kEv4A1vFMNCxaKtGf3u9bw-1
Received: by mail-ot1-f70.google.com with SMTP id 4so1381488otd.17
 for <ltp@lists.linux.it>; Fri, 06 Mar 2020 04:37:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p487yu/TrKR9OSxctE496ItPIyP4CeXUjJNs6NS5m9Q=;
 b=KL3WpyMzZJTCEGJXycdpArFIJ7JJrw6k8WT+PZUtvxMjcLxCQgxTj7u/ih/dNoarFy
 5fnPN9C/S2Ss5XFloUp/ecDkYI5m/yhxuhKDR9M4XPI33z9ETMRKKHX89fp/pSENVAGe
 XQ0j9TwqmNkt3puNZFZbdzPJm8e9jr3CwCPwAXs4IJZRp9VrZbvRxnMrpKM/MPCQUjzA
 Gp1vM7oeFrp/NWietXvFavbxMuQr/6AByn1P8sFF+MsI6rHQfP7p48xsR4vsCV6U2HUT
 nLptMch8WQ8wqcIrhLdN17rjcPqdh5awrGK7BOj6XHZeU88dOZoUS/mHvGWyGZJmtArs
 4Gog==
X-Gm-Message-State: ANhLgQ3DXn8ravGZvtVLG1mBFKSJf3GPjkI2bQCm+RLtKlb8xSLOfKO4
 sQsW+XnUSvrtudFoQE/nit5w1LWCipPy0BU6bUGVyM6fd9fIW2clqi+Yey25S+m8MjHsS0SiZu4
 SwhMcbrPOnpHeWqdhC8lQ2i7qRBc=
X-Received: by 2002:aca:5651:: with SMTP id k78mr2285082oib.153.1583498222146; 
 Fri, 06 Mar 2020 04:37:02 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuYD1uZSTiz/Dp/XBIAyrzyCYvuhtfWiwsk0pu7aYS7Kyk6iehJQfjUe8XTGwWZQanuolsw0zhcq7mTkDS47uQ=
X-Received: by 2002:aca:5651:: with SMTP id k78mr2285053oib.153.1583498221442; 
 Fri, 06 Mar 2020 04:37:01 -0800 (PST)
MIME-Version: 1.0
References: <20200306071221.GA13530@dell5510>
 <1583490720-10003-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1583490720-10003-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 6 Mar 2020 20:36:49 +0800
Message-ID: <CAEemH2ce95Uyi1cZumF4drQ7NtehVwWyhcTM5L7cEjcb7he+oA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] hugeshmctl01: Small refactor and remove
 stat_time
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1455046693=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1455046693==
Content-Type: multipart/alternative; boundary="000000000000fdf49405a02ee837"

--000000000000fdf49405a02ee837
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi XuYang,

Thanks for the quick work on refactoring. I'd suggest using the new
'.request_hugepages'  in the testcase, would mind having a try?

--- a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
@@ -53,8 +53,6 @@ static void func_set(void);
 static void func_rmid(void);
 static void *set_shmat(void);

-static long hugepages =3D 128;
-
 static struct tst_option options[] =3D {
        {"s:", &nr_opt, "-s   num  Set the number of the been allocated
hugepages"},
        {NULL, NULL, NULL}
@@ -290,15 +288,16 @@ void setup(void)
 {
        long hpage_size;

-       save_nr_hugepages();
-       if (nr_opt)
-               hugepages =3D SAFE_STRTOL(nr_opt, 0, LONG_MAX);
+       if (nr_opt) {
+               tst_hugepages =3D SAFE_STRTOL(nr_opt, 0, LONG_MAX);
+               tst_request_hugepages(tst_hugepages);
+       }
+
+       if (tst_hugepages =3D=3D 0)
+               tst_brk(TCONF, "No enough hugepages for testing");

-       limit_hugepages(&hugepages);
-       set_sys_tune("nr_hugepages", hugepages, 1);
        hpage_size =3D SAFE_READ_MEMINFO("Hugepagesize:") * 1024;
-
-       shm_size =3D hpage_size * hugepages / 2;
+       shm_size =3D hpage_size * tst_hugepages / 2;
        update_shm_size(&shm_size);
        shmkey =3D getipckey();
 }
@@ -306,7 +305,6 @@ void setup(void)
 void cleanup(void)
 {
        rm_shm(shm_id_1);
-       restore_nr_hugepages();
 }

 static struct tst_test test =3D {
@@ -318,4 +316,5 @@ static struct tst_test test =3D {
        .cleanup =3D cleanup,
        .test =3D test_hugeshmctl,
        .needs_checkpoints =3D 1,
+       .request_hugepages =3D 128,
 };


--=20
Regards,
Li Wang

--000000000000fdf49405a02ee837
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi XuYang,</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Thanks for the quick work on refactoring. I&#39;d suggest using the new &#3=
9;.request_hugepages&#39;=C2=A0 in the testcase, would mind having a try?</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr"><div class=3D"gmail_default" style=3D"font-size:small">--- a/testcases/=
kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c</div>+++ b/testcases/kernel/me=
m/hugetlb/hugeshmctl/hugeshmctl01.c<br>@@ -53,8 +53,6 @@ static void func_s=
et(void);<br>=C2=A0static void func_rmid(void);<br>=C2=A0static void *set_s=
hmat(void);<br>=C2=A0<br>-static long hugepages =3D 128;<br>-<br>=C2=A0stat=
ic struct tst_option options[] =3D {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;=
s:&quot;, &amp;nr_opt, &quot;-s =C2=A0 num =C2=A0Set the number of the been=
 allocated hugepages&quot;},<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 {NULL, NULL, NU=
LL}<br>@@ -290,15 +288,16 @@ void setup(void)<br>=C2=A0{<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 long hpage_size;<br>=C2=A0<br>- =C2=A0 =C2=A0 =C2=A0 save_nr_=
hugepages();<br>- =C2=A0 =C2=A0 =C2=A0 if (nr_opt)<br>- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hugepages =3D SAFE_STRTOL(nr_opt, 0, LONG_M=
AX);<br>+ =C2=A0 =C2=A0 =C2=A0 if (nr_opt) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 tst_hugepages =3D SAFE_STRTOL(nr_opt, 0, LONG_MAX)=
;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_request_hugepag=
es(tst_hugepages);<br>+ =C2=A0 =C2=A0 =C2=A0 }<br>+<br>+ =C2=A0 =C2=A0 =C2=
=A0 if (tst_hugepages =3D=3D 0)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tst_brk(TCONF, &quot;No enough hugepages for testing&quot;);<br>=
=C2=A0<br>- =C2=A0 =C2=A0 =C2=A0 limit_hugepages(&amp;hugepages);<br>- =C2=
=A0 =C2=A0 =C2=A0 set_sys_tune(&quot;nr_hugepages&quot;, hugepages, 1);<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hpage_size =3D SAFE_READ_MEMINFO(&quot;Hugepage=
size:&quot;) * 1024;<br>-<br>- =C2=A0 =C2=A0 =C2=A0 shm_size =3D hpage_size=
 * hugepages / 2;<br>+ =C2=A0 =C2=A0 =C2=A0 shm_size =3D hpage_size * tst_h=
ugepages / 2;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 update_shm_size(&amp;shm_size)=
;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 shmkey =3D getipckey();<br>=C2=A0}<br>@@ -=
306,7 +305,6 @@ void setup(void)<br>=C2=A0void cleanup(void)<br>=C2=A0{<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm_shm(shm_id_1);<br>- =C2=A0 =C2=A0 =C2=A0 res=
tore_nr_hugepages();<br>=C2=A0}<br>=C2=A0<br>=C2=A0static struct tst_test t=
est =3D {<br>@@ -318,4 +316,5 @@ static struct tst_test test =3D {<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 .cleanup =3D cleanup,<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .test =3D test_hugeshmctl,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 .needs_checkp=
oints =3D 1,<br>+ =C2=A0 =C2=A0 =C2=A0 .request_hugepages =3D 128,<br>=C2=
=A0};<br><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small"></div><br></div></div=
>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Re=
gards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000fdf49405a02ee837--


--===============1455046693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1455046693==--

