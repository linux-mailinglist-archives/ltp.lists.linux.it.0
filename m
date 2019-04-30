Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 69999F1E6
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 10:18:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 371573EACB1
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 10:18:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 1919C3EACA4
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 10:18:14 +0200 (CEST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8122C1000B08
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 10:18:10 +0200 (CEST)
Received: by mail-vk1-f172.google.com with SMTP id d74so1010566vka.3
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 01:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9LS8p4Ewb18hpyg1mC631bbZSeLolb3fTMEGuved/kI=;
 b=dPRCrFkjFHiYJmkXiR78bvrWvG78xPEduKU0n9SePcUM67OvCEmqn/H5knc1P4P/oO
 N6xs5tZ4FHPZFX4V05/EBw7F0k81UuUNbBCM81Y9ciCvXSmTVHhOdGSld1CDFzmBTHG5
 Sa6xiAv1n45XswyGExRRSPRsizHZg5zP0f3QFYIlzIULHqh6eWQOxOlKlgVVzN7124VI
 nuN68XDyrU/zPRuD1ndRj2faMGOleJ5Y6jVRdmW/rd0JAqMUL2fUT+cDtFxevuGy0noN
 0UdQ6satx0fnTvkXf6Nt+I1xXNeAG89vRpxY+XR7MbJnX9ACCcvnuxvff7prlmmH7qks
 9c9A==
X-Gm-Message-State: APjAAAUBzpc2sjRGmBOQwFDCD2+fNMU0yiTXPRL0YhaP0S6/D2nKszT1
 tQLSBoG6EYiu84arN6IfCX8eO8TgAoJOrES3rvtaYUhSZL0f1Q==
X-Google-Smtp-Source: APXvYqy76I/cRas72q0XxYeZ76jCrlAXpeGtIFrTvOfPaHMBZiHR94V04/rheLkjnP1H+R8Ib0I2GMdJjd9R2+iKOYI=
X-Received: by 2002:a1f:7f05:: with SMTP id o5mr16101659vki.91.1556612291831; 
 Tue, 30 Apr 2019 01:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190430043957.479-1-xzhou@redhat.com>
In-Reply-To: <20190430043957.479-1-xzhou@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 30 Apr 2019 16:18:00 +0800
Message-ID: <CAEemH2fX+8DhH56E0dmXxiX9FXb2i1VdF544y-AtxCPkEK+4uQ@mail.gmail.com>
To: Murphy Zhou <xzhou@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] OVL_MNT: put overlayfs lower, upper, work,
 mnt dir in separated mountpoint
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
Content-Type: multipart/mixed; boundary="===============0140772828=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0140772828==
Content-Type: multipart/alternative; boundary="000000000000b54bb20587bb0aa2"

--000000000000b54bb20587bb0aa2
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 30, 2019 at 12:40 PM Murphy Zhou <xzhou@redhat.com> wrote:

> Some tests are mounting overlayfs internally and run tests on it.
> This mount can fail if the filesystem we are running on does not
> support overlay mount upon it. For example, we are already running
> tests on overlayfs or NFS, or CIFS. Test will report broken and
> failure.
>
> Fixing this by put overlayfs dirs in a separaed mountpoint, like
> readahead02 by Amir.
>
> Signed-off-by: Xiong Zhou <xzhou@redhat.com>
>
Reviewed-by: Li Wang <liwang@redhat.com>

LGTM.

-- 
Regards,
Li Wang

--000000000000b54bb20587bb0aa2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Apr 30, 2019 at 12:40 PM Murphy Zhou &lt;<a=
 href=3D"mailto:xzhou@redhat.com">xzhou@redhat.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Some tests are mounting o=
verlayfs internally and run tests on it.<br>
This mount can fail if the filesystem we are running on does not<br>
support overlay mount upon it. For example, we are already running<br>
tests on overlayfs or NFS, or CIFS. Test will report broken and<br>
failure.<br>
<br>
Fixing this by put overlayfs dirs in a separaed mountpoint, like<br>
readahead02 by Amir.<br>
<br>
Signed-off-by: Xiong Zhou &lt;<a href=3D"mailto:xzhou@redhat.com" target=3D=
"_blank">xzhou@redhat.com</a>&gt;<br></blockquote><div><span class=3D"gmail=
_default" style=3D"font-size:small"></span>Reviewed-by: Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@redhat.com</a>&gt;</=
div><div><span class=3D"gmail_default"><br></span></div><div><span class=3D=
"gmail_default">LGTM.</span></div><div><br></div></div>-- <br><div dir=3D"l=
tr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>=
Li Wang<br></div></div></div></div>

--000000000000b54bb20587bb0aa2--

--===============0140772828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0140772828==--
