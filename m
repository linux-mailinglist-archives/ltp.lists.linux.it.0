Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E321708D
	for <lists+linux-ltp@lfdr.de>; Wed,  8 May 2019 07:50:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C2AA294AAA
	for <lists+linux-ltp@lfdr.de>; Wed,  8 May 2019 07:50:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id B4EE23EA02A
 for <ltp@lists.linux.it>; Wed,  8 May 2019 07:50:22 +0200 (CEST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1B494600B09
 for <ltp@lists.linux.it>; Wed,  8 May 2019 07:50:24 +0200 (CEST)
Received: by mail-vs1-f53.google.com with SMTP id w13so11917738vsc.4
 for <ltp@lists.linux.it>; Tue, 07 May 2019 22:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PcMfdk/c90jCVHrXYIt7kcI726ninzMx/3MEXlY+PPM=;
 b=DKOWiu8X+t7LrOkwGfeYXLKdm6HXocGjryfjdT4MTHGYhOY7ncngHexMMRVfGZD0G3
 jIQUYZzknP0hsHmaNZ1KgDc5bGVylqwRjmOF8pEA6BrIw8TXWda7YXUONXUUezKPqDds
 BR1783Xmocoy8JAZ+ii2y6wM+WDeiA1CKnqWArZSo8Eoi+yO9v7aFaplCzOcvLI65FgJ
 6urWgCDyCdwqKgrDqY0qxiZ+kohmEVBzUsZWtjHt+jmQiRUh8jEpibGEejsD2vZGnXBi
 zOwCQ76FcD/GVJ7xQGQAPBVSnBu8qD7/pcGMd+2byGujZF9vP3SKCSbJznBZLV3o/FWy
 I4fg==
X-Gm-Message-State: APjAAAXDF4rhYhMXw2XWyXwGGB5mRaLkGORE+1EvziYcZx2jAsUi+2j6
 uF70pCHF9MPTu25ibdrc7g0wdyN06IdG2cE8ts6Hu3UtX5myzg==
X-Google-Smtp-Source: APXvYqw5J5Sz1Z7bOE5JA0AhYoTpXUElf/P+JEtVGs4eCnBpvJETgYp4XtU+/HV2LJcYsjuJudub9leXqWISBzQ2mlg=
X-Received: by 2002:a67:f443:: with SMTP id r3mr15121817vsn.179.1557294620563; 
 Tue, 07 May 2019 22:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190508052318.9020-2-liwang@redhat.com>
In-Reply-To: <20190508052318.9020-2-liwang@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 8 May 2019 13:50:09 +0800
Message-ID: <CAEemH2fxyK48dffwvyCkbmZ59rvSUuLUeZW9MCYjBNhBi86Axw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.1 required=7.0 tests=HTML_IMAGE_ONLY_16,
 HTML_MESSAGE,SPF_PASS,T_REMOTE_IMAGE autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 1/2] numa: fix numa test error with non-continuous
	nodes
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1887374995=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1887374995==
Content-Type: multipart/alternative; boundary="000000000000ab86de058859e8ff"

--000000000000ab86de058859e8ff
Content-Type: text/plain; charset="UTF-8"

On Wed, May 8, 2019 at 1:23 PM Li Wang <liwang@redhat.com> wrote:

> Numa test failed on such machine which has non-continuous numa nodes,
> it gets wrong data because of the below syntax rule is not applicable
> to that special situation.
>   ` numastat -p $pid |awk '/^Total/ {print $'$((node+2))'}'
> In this patch, we fix that to print the last column replacing by '$NF'
> in awk.
>   ` numastat -p $pid |awk '/^Total/ {print $NF}'
>

Bah, I made a mistake on the node memory counting, it should be the asgd
node but not total, I will fix it in PATCH v2. Plz ignore this one. Sorry
about that.

-- 
Regards,
Li Wang

--000000000000ab86de058859e8ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><img class=3D"gmail-ajT" src=3D"https://ssl.=
gstatic.com/ui/v1/icons/mail/images/cleardot.gif"><br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 8, =
2019 at 1:23 PM Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Numa test failed on such machine which has non-continuous numa nodes=
,<br>
it gets wrong data because of the below syntax rule is not applicable<br>
to that special situation.<br>
=C2=A0 ` numastat -p $pid |awk &#39;/^Total/ {print $&#39;$((node+2))&#39;}=
&#39;<br>
In this patch, we fix that to print the last column replacing by &#39;$NF&#=
39;<br>
in awk.<br>
=C2=A0 ` numastat -p $pid |awk &#39;/^Total/ {print $NF}&#39;<br></blockquo=
te><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Bah, I made a mistake on the node memory counting, it should be the=C2=
=A0asgd node but not total, I will fix it in PATCH v2. Plz ignore this one.=
 Sorry about=C2=A0that.</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signa=
ture"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div><=
/div></div></div>

--000000000000ab86de058859e8ff--

--===============1887374995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1887374995==--
