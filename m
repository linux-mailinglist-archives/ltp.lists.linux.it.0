Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A4032783D
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 08:25:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28BD03C574E
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 08:25:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 31FAE3C3157
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 08:25:51 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 453F2600475
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 08:25:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614583548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AFg797CihscfEbBiLmLiz1k5QGYzsVvKcX29kjbAH40=;
 b=V61OWoiU+lot501C28MwjjPPUkm40Nf4pGsbjqi7Tdo3A1gV3DYGODwDHNpb0GhKNQrDgg
 D9ezO4Xkl9XEtHh4KYGaoajslCDj0xinluAQD1yqlI64L0nPSuWlfFiSQKJF+xqmKXW7jy
 c8FmzWvvfF7tmNbFR6PX4ouBaC9JGvg=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-UkPgPd0WONGxd7qp5zog_g-1; Mon, 01 Mar 2021 02:25:46 -0500
X-MC-Unique: UkPgPd0WONGxd7qp5zog_g-1
Received: by mail-yb1-f197.google.com with SMTP id y7so18093475ybh.20
 for <ltp@lists.linux.it>; Sun, 28 Feb 2021 23:25:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AFg797CihscfEbBiLmLiz1k5QGYzsVvKcX29kjbAH40=;
 b=LRs4DiyV0BxD2CBzm/LU+hQwdrhu0PQFRUqrcFBHhOw/5ZAlCUst52/bz4kZBqED+Q
 FK0AHpgt9Kp1HmJgkZyJy2LcwiFJl+2gLRMWu6NVUfs+ue8aUMcu6sJo2SEeUjcnoLU7
 41xBr+smwokcIbUtMEaKVlPtuEtDJN3eq9z0ot4yeONG4ZI1vDFML/RBe/loHFe3r6/u
 I/9r48hZg5NgEIxL3+cmnhIsJgIQxrA8XWk4S1FESmomCC75BHY9cGSiBt1BLXE9KN0Z
 fx2h/33estonCuCZVC46K0hB1GAhkhVen5WN3LE0okgEzDm+rkA++W82pnpwROP5SnZZ
 HwQA==
X-Gm-Message-State: AOAM533ADI9HqEXt55tpXqw5YO6/487MvHof1m/vkb76QsAmcujK9NJJ
 4Gp3iH1i/do1yAOvMyM4iPeM6Y4PM/+Xb79Zrvk9UuPNZgY+9j0Wev+696yKJB8xTnt056Kn/2g
 v1UPdEZM2E4Xv+Qtjdf3yTZj2YT4=
X-Received: by 2002:a25:e7d7:: with SMTP id
 e206mr21838278ybh.110.1614583545678; 
 Sun, 28 Feb 2021 23:25:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6jXgonSGmzQ8A1LI7JLtCThdEDIsG9l0NII9iAspRZBqFLbXq4fX/E3wLVhM6prkxwdtrAAcKqNK1MwZYDbc=
X-Received: by 2002:a25:e7d7:: with SMTP id
 e206mr21838267ybh.110.1614583545529; 
 Sun, 28 Feb 2021 23:25:45 -0800 (PST)
MIME-Version: 1.0
References: <20210225140925.16187-1-mdoucha@suse.cz> <87zgzr6yyc.fsf@suse.de>
In-Reply-To: <87zgzr6yyc.fsf@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Mon, 1 Mar 2021 15:25:31 +0800
Message-ID: <CAEemH2eAKu-kUNiq_hJVuFz9eJ99z7S6_E+n84u_9Rod8ZcgHg@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Reduce writev03 fuzzy_sync timeout
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
Content-Type: multipart/mixed; boundary="===============0072330541=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0072330541==
Content-Type: multipart/alternative; boundary="000000000000b11c2f05bc748612"

--000000000000b11c2f05bc748612
Content-Type: text/plain; charset="UTF-8"

Patch applied, thanks!

-- 
Regards,
Li Wang

--000000000000b11c2f05bc748612
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div dir="ltr"><div class="gmail_default" style="font-size:small">Patch applied, thanks!</div></div><div><br></div>-- <br><div dir="ltr" class="gmail_signature"><div dir="ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000b11c2f05bc748612--


--===============0072330541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0072330541==--

