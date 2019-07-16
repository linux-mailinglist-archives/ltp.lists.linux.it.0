Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2701E6A650
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 12:19:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AEB973C1D23
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 12:19:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 42F593C14F7
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 12:19:41 +0200 (CEST)
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
 [209.85.221.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E6F0C1400E71
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 12:19:39 +0200 (CEST)
Received: by mail-vk1-f194.google.com with SMTP id s16so4054486vke.7
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 03:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UGZAuJeuzK/ouwAxLfrKNuh2GuonVtqSZRX4TzYJOpM=;
 b=XlcYx1K8Yq6yhhIFz4R96uS1gvZyKFBlRvIbgXfvTkCr/7NZ9wvfvciAisift4KDhJ
 QhpXyWNFYNGMUf8DxWS4cH/4kp04yMdVEo/21gFYkaVowgoxf/NwDRdmuwQHvm7fv7Mw
 mcSSgMImRFkurDNzVA75bYuNZCYayzlOXqMUhXe1UcnqGvmXYLPTg1wzMMtifm+WCr8b
 BRFKHLARskw7G4maiqjWpnoUNvFCOFzm8ed2Ut8Ltt+vwWEy3di9r80lJeT6gbEp/YpD
 Xuf0gfSiHwOaGKv6oxYio0KEGl6zgF8r0xLHOtcUAn8bsCoifbBZkY9OuME0+MMXr+Z/
 QOxg==
X-Gm-Message-State: APjAAAXHFbV8sXnDwMUmbh+ubJkDmqZBlD8vghB4tewfRFSFy0DUqQxf
 rm2zC/YDuC/V+hlxAkrq5QhqJ0zNG0XdpLKtpw3t6Q==
X-Google-Smtp-Source: APXvYqyEFcT8UHpXb34S3xBQBXSgSXhNCQxl10DssXxxB0dDPIwN46m1LoCQR+fuvWp+JuQXVPf9LzF8EApNjaVRSIk=
X-Received: by 2002:a1f:3dc1:: with SMTP id k184mr11795484vka.24.1563272378696; 
 Tue, 16 Jul 2019 03:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190711141026.14705-1-mmoese@suse.de>
In-Reply-To: <20190711141026.14705-1-mmoese@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Tue, 16 Jul 2019 18:19:27 +0800
Message-ID: <CAEemH2cjr23TZUDNLAt2Vvk03W8sHNy+eaJT6YYXSFU+KxmTvQ@mail.gmail.com>
To: Michael Moese <mmoese@suse.de>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] Add a regression test for CVE-2017-1000380
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
Content-Type: multipart/mixed; boundary="===============1840046480=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1840046480==
Content-Type: multipart/alternative; boundary="000000000000d1ee97058dc9b617"

--000000000000d1ee97058dc9b617
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 11, 2019 at 10:10 PM Michael Moese <mmoese@suse.de> wrote:

> ...
> +
> +static void setup(void)
> +{
> +       tst_fzsync_pair_init(&fzsync_pair);
> +       tst_taint_init(TST_TAINT_W | TST_TAINT_D);
> +       snd_fd = SAFE_OPEN("/dev/snd/timer",
> +                       O_RDONLY|O_CREAT|O_NOCTTY|O_SYNC|O_LARGEFILE, 0);
>

Should we check if the file exists before opening it?

Otherwise, snd_timer01 failed as:

# ./snd_timer01
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
safe_macros.c:225: BROK: snd_timer01.c:73: open(/dev/snd/timer,1052992,00)
failed: ENOENT

# lsmod |grep -i snd

# grep -i snd /boot/config-4.18.0-107.el8.s390x

# ls /dev/snd/timer
ls: cannot access '/dev/snd/timer': No such file or directory

-- 
Regards,
Li Wang

--000000000000d1ee97058dc9b617
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jul 11, 2019 at 10:10 PM Michael Moese &lt;=
<a href=3D"mailto:mmoese@suse.de">mmoese@suse.de</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_defaul=
t" style=3D"font-size:small">...</span><br>
+<br>
+static void setup(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_fzsync_pair_init(&amp;fzsync_pair);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_taint_init(TST_TAINT_W | TST_TAINT_D);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_fd =3D SAFE_OPEN(<span class=3D"gmail_defau=
lt" style=3D"font-size:small"></span>&quot;/dev/snd/timer&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0O_RDONLY|O_CREAT|O_NOCTTY|O_SYNC|O_LARGEFILE, 0);<br></blockquote=
><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small"=
>Should we check if the file exists before opening it?=C2=A0</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">Otherwise, snd_timer01 failed as:</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div># ./snd_ti=
mer01 <br>tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s<br>safe_macr=
os.c:225: BROK: snd_timer01.c:73: open(/dev/snd/timer,1052992,00) failed: E=
NOENT<br><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small"># lsmod |grep -i snd<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small"># grep -i snd /boot/confi=
g-4.18.0-107.el8.s390x=C2=A0</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div># ls /dev/snd/timer<br>ls: cannot access &#39;/dev/=
snd/timer&#39;: No such file or directory<br><div class=3D"gmail_default" s=
tyle=3D"font-size:small">=C2=A0<br></div></div></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li=
 Wang<br></div></div></div></div>

--000000000000d1ee97058dc9b617--

--===============1840046480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1840046480==--
