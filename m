Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DFD2A5C2C
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 02:50:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 20A483C5469
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 02:50:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id BE2A73C2610
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 02:50:45 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 18975140051B
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 02:50:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604454643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vnEPm2mtubrMXXilzPMTbN8f6zDJWtzj6q4T8hIR4R0=;
 b=BzwkiVWo/8bk5abD41VTHkSRQZAKXxj0d500I5oT2h34b4PCxONtO6AMnPrqrRNDhVxJ2M
 qcMjOdZFFCEHOypl9YhMfGX/uoO0hoYJ24ce/JW0CUOYG+CHp9BVZvP0+7cw3Sb3rj88Ps
 P4W7Xj7rBU2RqqBBEVSIgzfsSO+M5lQ=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-NsEHaaJOOHeh2y9t367CQA-1; Tue, 03 Nov 2020 20:50:41 -0500
X-MC-Unique: NsEHaaJOOHeh2y9t367CQA-1
Received: by mail-yb1-f199.google.com with SMTP id h6so20320354ybk.4
 for <ltp@lists.linux.it>; Tue, 03 Nov 2020 17:50:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vnEPm2mtubrMXXilzPMTbN8f6zDJWtzj6q4T8hIR4R0=;
 b=QPyx+EYUPZU3o/E8yls2TybRvT/UFl9YwVvhLkDJQGueUO1G7Do0oJkYoT+35+G/Ok
 G/K0jy59+A7wvDU9SsR64ZvG99AFlhrxXu1c/l6C7dF6uIHa4KiEOeaO93nH89qEgUMS
 VZ/9S6cWtC1TazOi8Ygpi3FpibBHT+i7xVFa6QDijSEwg2mL5crgkHM6VPv1AYuybtEq
 hlfIDHNxT4CoE8SsSlzK8VVXCSSqDgYm4SvkBoOzusREGGNLJes/pkuHQvR8uXdTQIYX
 Sutt+RJliS8aaSxaIYllIhjpx48J/R2im6X+CK+kXzzm3QVYox5QhhrnOL7EUf927Szn
 zaXA==
X-Gm-Message-State: AOAM531VAZiXld2+Dqjon7TFzy25g/xumSynWK4igJcuXB4/+q0AX5Ng
 ilSmURtbJ0lVRqhTNgk8v3yQWZbb0CnDyBg0niz/qN4duiCL+9MTNTTR20u3OYDocIDp4znRb90
 VnwHRNxyAGFAE9IzAlY0156wa64g=
X-Received: by 2002:a25:3b81:: with SMTP id i123mr33377510yba.86.1604454640825; 
 Tue, 03 Nov 2020 17:50:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxy/V8kJRZ2dOhcApmgEl9Z0t+0KFNZRIldKzxXUikQ+CXDIfUI1yTrbdxftTHGedoK3DvBdUx8j33tb1xSu4c=
X-Received: by 2002:a25:3b81:: with SMTP id i123mr33377490yba.86.1604454640603; 
 Tue, 03 Nov 2020 17:50:40 -0800 (PST)
MIME-Version: 1.0
References: <20201103154950.32000-1-rpalethorpe@suse.com>
In-Reply-To: <20201103154950.32000-1-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 4 Nov 2020 09:50:28 +0800
Message-ID: <CAEemH2c2pm438iDTZZDOAoFBHL_AW0-kUh=qB5e6JhssG0+img@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] madvise06: Add tag for "mm: memcg: link page
 counters to root ..."
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
Content-Type: multipart/mixed; boundary="===============2003065730=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2003065730==
Content-Type: multipart/alternative; boundary="000000000000e96b0d05b33e34db"

--000000000000e96b0d05b33e34db
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 3, 2020 at 11:50 PM Richard Palethorpe <rpalethorpe@suse.com>
wrote:

> The test may trigger a warning if bf4f059 is present (5.9) and
> use_hierarchy=0 which is fixed by 8de15e920dc8. Full details of the
> bug are in the kernel commit description and I do not want to repeat
> them in the test description as they are likely to be irrelevant to
> most readers.
>
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>

Pushed.
-- 
Regards,
Li Wang

--000000000000e96b0d05b33e34db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 3, 2020 at 11:50 PM Richard Palethorpe =
&lt;<a href=3D"mailto:rpalethorpe@suse.com">rpalethorpe@suse.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The test ma=
y trigger a warning if bf4f059 is present (5.9) and<br>
use_hierarchy=3D0 which is fixed by 8de15e920dc8. Full details of the<br>
bug are in the kernel commit description and I do not want to repeat<br>
them in the test description as they are likely to be irrelevant to<br>
most readers.<br>
<br>
Signed-off-by: Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.co=
m" target=3D"_blank">rpalethorpe@suse.com</a>&gt;<br></blockquote><div><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">Pushed.</div><=
div class=3D"gmail_default" style=3D"font-size:small"></div></div>-- <br><d=
iv dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br>=
</div><div>Li Wang<br></div></div></div></div>

--000000000000e96b0d05b33e34db--


--===============2003065730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2003065730==--

