Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFD427C52E
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 13:33:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2D633C2A9E
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 13:33:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 4FB1E3C2A0F
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 13:33:33 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 55D0E600A5E
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 13:33:32 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601379211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1UWBaMKfrnVDoMLY88pgVeyvGW/gEz4POp0qiuEkzuw=;
 b=O8vh0T8kwkrbD54MBo5Ug+eW8j8qDzjEoPQB+r/Dm0US4Wb6yZWCn4H4PBwLw29tMFURaZ
 UdNqD4pr1lA7tyMXhJukm9Qm1MR2UOFuOQ1irk9EEQy/retrxYYqmGmOFDRtkRZySwLJbi
 7Bb+NjiLWkKaTQqR4VjJ/7//xFsySrQ=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-I2tJ44JCP9uSqvAcZ6uuVg-1; Tue, 29 Sep 2020 07:33:29 -0400
X-MC-Unique: I2tJ44JCP9uSqvAcZ6uuVg-1
Received: by mail-yb1-f197.google.com with SMTP id r2so4433912yba.7
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 04:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1UWBaMKfrnVDoMLY88pgVeyvGW/gEz4POp0qiuEkzuw=;
 b=rxPxMXjCE6P4g3Mw55lwLVjt0t0yoSABivAy+l2PKjcrEiuuNWqKZSIJnkBb5o7Zbj
 HNXH+TqeY3lm+Ma3as8BModNjPPVuNZmemUU2xMPrOjlnmDLp8t/DbXBSLk6p7FqlFUJ
 vV+SuWAKMaTKMwNKnbabbZRSfwq1dvi7ZLzxJTA24X6y0JBW5CrcWo0wJz80jzLxoqOX
 GKMknHxZuHGkqXNLv8pzio+W4ntwlEgX0S40DbKBG7SV62lsDE8bPR9eAu21rIK/S4T2
 Iia+tS7nCeulW7eN5lJcGXDJYwryRJsIeoxenh+7uNgMlZ7rGKih52deLTEKOeCo6Pjs
 XE/w==
X-Gm-Message-State: AOAM531xn+o92Iht9h0qlHzK1kAiiq7f+WO4qX//c8kbaFy5NkCV3Ws+
 hJdF5r3stMJdp1L4jpsMJyUvLGBD64oGSzwNUscXyxvGYeHSPQcJ/B8grPsxs8dniXRK09Kr1J0
 9McpHItG8aW3zaabmOhKdp6TL08I=
X-Received: by 2002:a25:606:: with SMTP id 6mr5538726ybg.86.1601379208533;
 Tue, 29 Sep 2020 04:33:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1C8o2gemfYDYZawidoYciNApaM1yc3aEL1uOyfZVbEefN+cj1uP8RECm2HuntkVyrhsEvFMImv95CGUQIH3Q=
X-Received: by 2002:a25:606:: with SMTP id 6mr5538706ybg.86.1601379208338;
 Tue, 29 Sep 2020 04:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200929105824.28793-1-pvorel@suse.cz>
In-Reply-To: <20200929105824.28793-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 29 Sep 2020 19:33:16 +0800
Message-ID: <CAEemH2d94NWtLHOaegLh=VMU=OT_=P8f1pqLJ_CcK00t6yAAAw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] doc/user-guide: Shorten the description
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
Content-Type: multipart/mixed; boundary="===============0815694215=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0815694215==
Content-Type: multipart/alternative; boundary="000000000000dd3a8d05b0722686"

--000000000000dd3a8d05b0722686
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 29, 2020 at 6:58 PM Petr Vorel <pvorel@suse.cz> wrote:

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
>

For the series:

Reviewed-by: Li Wang <liwang@redhat.com>
-- 
Regards,
Li Wang

--000000000000dd3a8d05b0722686
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Sep 29, 2020 at 6:58 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Petr Vorel &lt;<=
a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt;<b=
r></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-si=
ze:small">For the series:</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redha=
t.com</a>&gt;</div><div class=3D"gmail_default" style=3D"font-size:small"><=
/div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"lt=
r"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000dd3a8d05b0722686--


--===============0815694215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0815694215==--

