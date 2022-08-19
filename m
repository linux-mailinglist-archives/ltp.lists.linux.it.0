Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 698CF59A53C
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Aug 2022 20:14:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF0C23CA2B7
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Aug 2022 20:14:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 085093CA1B8
 for <ltp@lists.linux.it>; Fri, 19 Aug 2022 20:13:58 +0200 (CEST)
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 24C2260115E
 for <ltp@lists.linux.it>; Fri, 19 Aug 2022 20:13:58 +0200 (CEST)
Received: by mail-vs1-xe33.google.com with SMTP id o123so5242272vsc.3
 for <ltp@lists.linux.it>; Fri, 19 Aug 2022 11:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=j6D9xpmd+rm2oQOEJkhSNcAqQ/vQwiINciNnUs7xqdc=;
 b=ITDk4kpmvmKACiunbr1fZcFZgYB7GfWKsSwwAouym4nwworK8ogROgsoqxr3k+Dk6R
 ucXe6HF9j0eZmOV/muRZaoGV56qnTyLhXVPyWYc40XtENtV8fULaAvmaAN4HeMiaX3dw
 JsE5sGVNbfDBp7hmkJIGfw4E9wwVWstoE0RNBA1Jl0QJxQKhZ4Dv1Ar/XhVLg55igov5
 qxtGhQ+UhZHEYNxgRWZhiKdPDM7cdKM4H2VhE3RPzzTwWH3W7vfXDwhGO29Wpp900hep
 ++hIUJLtZ3GII6Sz4+eATwtwxBl7avsZ2YwzedjH3RTw/Vt8EtfkWBdLGjgbDtJaHt1T
 58QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=j6D9xpmd+rm2oQOEJkhSNcAqQ/vQwiINciNnUs7xqdc=;
 b=IaR6W1NqfmyA6b3dUdKPkM5ERJgE1I/qKpFS4vheZKDaXOhqyKtARrfGMY+bz8QVbZ
 /pBg+82fW9mSQSJzJGheYM7Vkve+NZUrIBotmbrTBgRksVH7+Dtu2+ncLSE7vvYtcCXg
 hJLSJaESAfT9BPfu/Quha9ESEyMCVcC1bR3kpEHTeNoyGZA31qnCGxPnhB1/4IVn39k1
 almxw4oDUUt6i0QlINDKDnb2jqUvwgQb0nv5ZfN9FVNCDAm75PZb09xbtNMTB4mwNAsb
 4YB3Dof7qmha1q4WLcXjygv+ObsH+65i+qojuPP6XiMg0Yqt4Km31JwmUEpc+2l+Cb/n
 lmQw==
X-Gm-Message-State: ACgBeo3g8KwTF7fFdOhermJe7ONRyppJm8i4kBi62Cykf4mxU8dX3QY+
 77K9pk32AYoeLNRdSzyFjWsmwpu1gnBb0+IL7EeINg==
X-Google-Smtp-Source: AA6agR4St/aBZcBfBX+6XXupcIQaxpi+lLzV71LD+2Jb+JXePMTtkk4kAXL9t0s9FYtKGr4HX5PMud09I8U977fRJXY=
X-Received: by 2002:a05:6102:3a4b:b0:385:63bb:ca6b with SMTP id
 c11-20020a0561023a4b00b0038563bbca6bmr3448627vsu.36.1660932836836; Fri, 19
 Aug 2022 11:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAG4es9Wn+wZRu6xr-FgZ=pTq4ReGdrmsmGYO4ZXvKj8ee3QH8w@mail.gmail.com>
 <CAG4es9XhZ7ksvLxwRNO73FC4DQc7KteUQAUPwipbks6kGsvFmw@mail.gmail.com>
 <YvUhZ/9Yf7eZ4a32@yuki> <YvuRAR1DSi67PDzh@pevik>
 <CAG4es9XdXgmPOQK3i+FL3VD-Y8C39sAShwdM6bi7U-CJjk7BQg@mail.gmail.com>
 <YvyxCXTGYpLd8kbQ@pevik>
 <CAG4es9XkRDYnwDr9huepzGhEiHxWdu40DOK9ouA2yWGqv842ow@mail.gmail.com>
 <CAG4es9WmHd52fmjdt7RBkSXEtnGuC2jkBO6UdCTbaHOq8CDgVw@mail.gmail.com>
 <Yv9F8MnPGyLLE0Zm@pevik> <Yv9Msztwn77epwCP@yuki> <Yv9ooj5RVoiQ1FhC@pevik>
In-Reply-To: <Yv9ooj5RVoiQ1FhC@pevik>
Date: Fri, 19 Aug 2022 11:13:31 -0700
Message-ID: <CAG4es9XOKQRh7Us8b+Rb+Ybn4fP8yHTvTC+bB1naLhQvpD0X4A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,
 USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] syscalls/signal06: add volatile to loop
 variable
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
From: Edward Liaw via ltp <ltp@lists.linux.it>
Reply-To: Edward Liaw <edliaw@google.com>
Cc: kernel-team <kernel-team@android.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1588123872=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1588123872==
Content-Type: multipart/alternative; boundary="000000000000bcc78105e69c0fc3"

--000000000000bcc78105e69c0fc3
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 19, 2022 at 2:14 AM Joerg Vehlow <lkml@jv-coder.de> wrote:

> Why is this even split up into two asm instructions?
> I guess there is nothing, that prevents the compiler from reordering the
> asm instructions, because it does not know, that they have side effects
> (they are not marked volatile).
>
> asm volatile ("syscall" : : "a"(__NR_tkill), "D"(pid), "S"(SIGHUP):
> "rax", "rcx", "r11");
>

I tried this and clang complains that the "Asm-specifier for input or
output variable conflicts with asm clobber list" for rax.  Should it be

  asm volatile ("syscall" : : "a"(__NR_tkill), "D"(pid), "S"(SIGHUP) :
"rcx", "r11");

instead?  Is it implicit that __NR_tkill is going into rax so it will be
clobbered?

Thanks,
Edward

--000000000000bcc78105e69c0fc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div>On Fri, Aug 19, 2022 at 2:14 AM=
 Joerg Vehlow &lt;<a href=3D"mailto:lkml@jv-coder.de">lkml@jv-coder.de</a>&=
gt; wrote:<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Why is this even split up into two asm instructions?<br>I guess=
 there is nothing, that prevents the compiler from reordering the<br>asm in=
structions, because it does not know, that they have side effects<br>(they =
are not marked volatile).<br><br>asm volatile (&quot;syscall&quot; : : &quo=
t;a&quot;(__NR_tkill), &quot;D&quot;(pid), &quot;S&quot;(SIGHUP):<br>&quot;=
rax&quot;, &quot;rcx&quot;, &quot;r11&quot;);<br></blockquote><div><br></di=
v><div>I tried this and clang complains that the &quot;Asm-specifier for in=
put or output variable conflicts with asm clobber list&quot; for rax.=C2=A0=
 Should it be</div><div><br></div><div>=C2=A0 asm volatile (&quot;syscall&q=
uot; : : &quot;a&quot;(__NR_tkill), &quot;D&quot;(pid), &quot;S&quot;(SIGHU=
P) : &quot;rcx&quot;, &quot;r11&quot;);<br></div><div><br></div><div>instea=
d?=C2=A0 Is it implicit that __NR_tkill is going into rax so it will be clo=
bbered?</div><div><br></div><div>Thanks,</div><div>Edward</div></div></div>

--000000000000bcc78105e69c0fc3--

--===============1588123872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1588123872==--
