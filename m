Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1ACE1395
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 10:06:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 406E53C2298
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 10:06:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id F2C0F3C228D
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 10:06:35 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4DB1D200112
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 10:06:35 +0200 (CEST)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1786C7BDA1
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 08:06:33 +0000 (UTC)
Received: by mail-oi1-f199.google.com with SMTP id p206so11373496oib.14
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 01:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/uHE42kllg0pqKm5ahlXS2lQR61hiTuW98KxSZpc3+E=;
 b=eZrmuXti97A5nydfhYk0d/h/ToaEDNC1K6liau7NSUaDoOnVXC3zm6REIrJNc05YkC
 PdlxTvlXwT02JofqEmhjoofDAs1ySdok/m9U2uicEui7nDv7LlnHqEExUsBIV24B87Tx
 3n5VCX3blAg3l57SxBokIWOd/2An2RUdVhyFkVQPVHseQBXgTl+zdzDeP4KnEz58tGTQ
 Ohryp9t8piq/ElkJAiBkFszAz6xMMMACppGB9aIYGHP0PHlYMIj2T4vNySTpt42GwJMt
 oaR5aP+tTvmnxD4zzM6Lld94aFN3d5QP7GxiL8YuwPTYf2Gcp+Rz3xy4i2CFlKt6MwDw
 oCDQ==
X-Gm-Message-State: APjAAAVEFYV3DpPQHoQW/2oxqH/Qf6hdNXI6eW9IV2jGyA9RU8V+2b+e
 4vFT3geYsy3goheAjgKuAhi7oVxr3irRJsN9t7/WsCFX7J3kBBxfA93Yj9tkWKCrfFLDm0piub2
 I4imLWCwqRa8mD+G4CIebKRIKRHQ=
X-Received: by 2002:a05:6808:8d9:: with SMTP id
 k25mr6148649oij.153.1571817992559; 
 Wed, 23 Oct 2019 01:06:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZ1iSSgSUR0rC8+OIxkTX6LYc1DGQnf4b0DwnPijIE01U6IIgpdRY5qo3UfGnB5I/mcyR2c/KRmoT4VuoPiuU=
X-Received: by 2002:a05:6808:8d9:: with SMTP id
 k25mr6148628oij.153.1571817992298; 
 Wed, 23 Oct 2019 01:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191022140757.29713-1-chrubis@suse.cz>
 <20191022140757.29713-2-chrubis@suse.cz>
 <CAEemH2eCpbAuU2xYNtiv9Wq4VwHJE2dZRXnO9v+2H=1=JQJUXQ@mail.gmail.com>
 <1270016842.8517878.1571817492480.JavaMail.zimbra@redhat.com>
In-Reply-To: <1270016842.8517878.1571817492480.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 23 Oct 2019 16:06:21 +0800
Message-ID: <CAEemH2f2D4PjaMaOE_ADUqg5igEi97nHBsH6A7qXtO-2KO7btg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] lib: Add support for test tags
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
Content-Type: multipart/mixed; boundary="===============0427559842=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0427559842==
Content-Type: multipart/alternative; boundary="000000000000153ea105958f6538"

--000000000000153ea105958f6538
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 23, 2019 at 3:58 PM Jan Stancek <jstancek@redhat.com> wrote:

>
> ----- Original Message -----
> > Maybe we can merge this string compare in the same for loops?
> >
> > e.g: http://pastebin.test.redhat.com/808028
>
> Li, I don't think this is public server.
>

Sorry, thanks for the reminder.
[I copied the below code to gmail, it always lost the indent]

static void print_failure_hints(void)
{
        unsigned int i;
        int hint_printed = 0;
        const struct tst_tag *tags = tst_test->tags;

        if (!tags)
                return;

        for (i = 0; tags[i].name; i++) {
                if (!strcmp(tags[i].name, "linux-git")) {
                        if (hint_printed != 1) {
                                hint_printed = 1;
                                print_colored("\nHINT: ");
                                printf("You _MAY_ be missing kernel fixes,
see:\n\n");
                        }

                        printf(LINUX_GIT_URL "%s\n", tags[i].value);
                } else if (!strcmp(tags[i].name, "CVE")) {
                         if (hint_printed != 2) {
                                 hint_printed = 2;
                                 print_colored("\nHINT: ");
                                 printf("You _MAY_ be vunerable to CVE(s),
see:\n\n");
                          }

                        printf(CVE_DB_URL "%s\n", tags[i].value);
                } else {
                        print_colored("\nERROR: ");
                        printf("tags[%d].name should be linux-git or
CVE\n", i);
                        return;
                }
        }
}

-- 
Regards,
Li Wang

--000000000000153ea105958f6538
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Oct 23, 2019 at 3:58 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
----- Original Message -----<br>
&gt; Maybe we can merge this string compare in the same for loops?<br>
&gt; <br>
&gt; e.g: <a href=3D"http://pastebin.test.redhat.com/808028" rel=3D"norefer=
rer" target=3D"_blank">http://pastebin.test.redhat.com/808028</a><br>
<br>
Li, I don&#39;t think this is public server.<br></blockquote><div><br></div=
><div><div class=3D"gmail_default" style=3D"font-size:small">Sorry, thanks =
for the reminder.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">[I copied the below code to gmail, it always lost the indent]</div><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div>static void pri=
nt_failure_hints(void)<br>{<br>	<span class=3D"gmail_default" style=3D"font=
-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>unsigned int i;<br>	<span c=
lass=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>int hint_printed =3D 0;<br>	<span class=3D"gmail_default" style=
=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>const struct tst_ta=
g *tags =3D tst_test-&gt;tags;<br><br>	<span class=3D"gmail_default" style=
=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>if (!tags)<br>		<sp=
an class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>return;<br><br>	<span class=3D"gm=
ail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>f=
or (i =3D 0; tags[i].name; i++) {<br>		<span class=3D"gmail_default" style=
=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>if (!strcmp(tags[i].name, &quot;linux-git&quot;)) {<br>			<span =
class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>if (hint=
_printed !=3D 1) {<br>				<span class=3D"gmail_default" style=3D"font-size:=
small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>hint_printed =3D 1;<br=
>				<span class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span>print_colored(&quot;\nHINT: &quot;);<br>			=
	<span class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>printf(&quot;You _MAY_ be missing kernel fixes,=
 see:\n\n&quot;);<br>			<span class=3D"gmail_default" style=3D"font-size:sm=
all">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>}<br><br>			<span class=3D"gmail_default" style=3D"fon=
t-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span>printf(LINUX_GIT_URL &quot;%s\n&quot;, tags=
[i].value);<br>		<span class=3D"gmail_default" style=3D"font-size:small">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>} else if (!=
strcmp(tags[i].name, &quot;CVE&quot;)) {<br>			<span class=3D"gmail_default=
" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span>if (hint_printed !=3D 2=
) {<br>				<span class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span>hint_printed =3D 2;<br>				<sp=
an class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0</span>print_colored(&quot;\nHINT: &quot;);<br>				=
<span class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0</span>printf(&quot;You _MAY_ be vunerable to CV=
E(s), see:\n\n&quot;);<br>			<span class=3D"gmail_default" style=3D"font-si=
ze:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>}<br><br>			<span class=3D"gmail_default=
" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>printf(CVE_DB_URL &quot;%s\n&=
quot;, tags[i].value);<br>		<span class=3D"gmail_default" style=3D"font-siz=
e:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>} e=
lse {<br>			<span class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>print_colored(&quot;\nERROR: &quot;);<br>			<span class=3D"gmail=
_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0</span>printf(&quot;tags=
[%d].name should be linux-git or CVE\n&quot;, i);<br>			<span class=3D"gmai=
l_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>return;<br>		<span cla=
ss=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</span>}<br><span class=3D"gmail_default" =
style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>}<span class=
=3D"gmail_default" style=3D"font-size:small"></span><br><div class=3D"gmail=
_default" style=3D"font-size:small">}</div></div></div><div><br></div>-- <b=
r><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,=
<br></div><div>Li Wang<br></div></div></div></div>

--000000000000153ea105958f6538--

--===============0427559842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0427559842==--
