Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 993E21B8E36
	for <lists+linux-ltp@lfdr.de>; Sun, 26 Apr 2020 11:31:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B90D3C2885
	for <lists+linux-ltp@lfdr.de>; Sun, 26 Apr 2020 11:31:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 7F1DF3C0271
 for <ltp@lists.linux.it>; Sun, 26 Apr 2020 11:31:36 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id B239D601A6B
 for <ltp@lists.linux.it>; Sun, 26 Apr 2020 11:31:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587893493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O40FILvk28lHWDjxDIZ/x+S+Hg9x9XHPYB13GSc3RbM=;
 b=C4hPmS34jaLKPXWn8CH2SmMKpCcbzRDSA0ZAy29dZrQ/1A+ueDCY1+T72o/nlWqN7E/K/b
 ZhqXvBrIaIWjylULoAqfavu6+u3PccQQ9p5tGtwRuuOGHabnPfzzgMf3exRWLjH+WoyvoH
 amU5jRq82s4xUUcaqzssJz5KwI9JJGI=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-_ea1eD3sPIyFksuzBFjg-w-1; Sun, 26 Apr 2020 05:31:21 -0400
X-MC-Unique: _ea1eD3sPIyFksuzBFjg-w-1
Received: by mail-lf1-f69.google.com with SMTP id y71so6065365lff.4
 for <ltp@lists.linux.it>; Sun, 26 Apr 2020 02:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BYFbw8fDSqMaQTt7ccaH44Xu57cMuYwEezcbqCT1N7I=;
 b=RFVLPo1lixhYv9S1dMz/uul4wau7/d1Y/h7WWKnpPCwU2xCZhtuE/n0FlPwNu2p7uf
 wPtIio6rO2JwyitUa574o5vzyRpknrwBo3z4AV3qudFsMrqqn1geZton3zFzHmgaiVpE
 S3MGBNhQZXWmDS528PRBMd6jgaqGx2ylN2HZlCswO8H+kijdyo+fqEEx8epcJoJvbmSk
 yiC8Z+ha+NgjcNboFYKNbiA5b0bB5Z59yQuYiExYMArcHzuJwsiqgYJdRv7WeCHIGbCO
 gSsG0bLVfJQ1sO3XgILsA9Uhe6s2bxRF/1DYyMr/JuVPP7NtrsY4IdWB4Fz4QvF9uQtH
 kE6A==
X-Gm-Message-State: AGi0PuYerMStcY599vxP+XOUcTuU1al883JaLsPKy12OSfQPTSgLzA1U
 4SmL4/hpfekfN3B8FpxocHgc2cu0L3AjgXSKwWcVY92mpqlfrpTapHucgmWI/Hmj5/JDRwK08Fu
 5BOU5UTumJXrOdR6gT8doWH5tOWo=
X-Received: by 2002:a05:6512:1c5:: with SMTP id
 f5mr11830458lfp.138.1587893479565; 
 Sun, 26 Apr 2020 02:31:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypLIl9JbpfCOKtb7ufXlG95UAE/McZQ3tRIkMoDUxN2xPBF1MW807iOGhImM++9GWWqYZ1RBN1oXqQ8CeiJ8DOU=
X-Received: by 2002:a05:6512:1c5:: with SMTP id
 f5mr11830447lfp.138.1587893479312; 
 Sun, 26 Apr 2020 02:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <1587552329-21738-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1587552329-21738-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Sun, 26 Apr 2020 17:31:08 +0800
Message-ID: <CAEemH2dhh-30o0XSwRSajnzfnpYTu=ZdO+=SAj03UcccGRhPOg@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/3] syscalls/pipe2_01: convert into new API
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
Content-Type: multipart/mixed; boundary="===============2138221129=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2138221129==
Content-Type: multipart/alternative; boundary="000000000000c6bb4a05a42e42d0"

--000000000000c6bb4a05a42e42d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xu,

Patch1/3 and 2/3 pushed with some modifications(code indent and kver
checks).

--=20
Regards,
Li Wang

--000000000000c6bb4a05a42e42d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div><span class=3D"gmail_defau=
lt" style=3D"font-size:small">Hi Xu,</span></div><div><br></div></div><div>=
<div class=3D"gmail_default" style=3D"font-size:small">Patch1/3 and 2/3 pus=
hed with some modifications(code indent and kver checks).</div></div><div><=
br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"=
><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000c6bb4a05a42e42d0--


--===============2138221129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2138221129==--

