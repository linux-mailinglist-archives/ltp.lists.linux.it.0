Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BD72E7DDF
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Dec 2020 04:37:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF9EF3C559B
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Dec 2020 04:37:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E35AC3C2612
 for <ltp@lists.linux.it>; Thu, 31 Dec 2020 04:37:41 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 6CCD86009D4
 for <ltp@lists.linux.it>; Thu, 31 Dec 2020 04:37:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609385858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rtUb4VfrOiXtE8/EIfpP+FxgrB9VmLlXC3CgBSk3ZFY=;
 b=Tog6tXcCMMkU7qxGh7cN4U6bRvCWRXctODdstQbS3YjdCpEGrkstsI6Z1LnSsgvivFJaPg
 yM6BIfBEa4U3dUqGz+n8oVqaG1k41XRMnc31EcXs9EOcC7HrVnk/au6eztc75OLrlcf1to
 sYy5i+YZZa19fsSVQdnJ/r2JDJgxN5g=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-1C0Qa2-8N3CiNuJIt0dRrg-1; Wed, 30 Dec 2020 22:37:35 -0500
X-MC-Unique: 1C0Qa2-8N3CiNuJIt0dRrg-1
Received: by mail-yb1-f197.google.com with SMTP id x17so31543917ybs.12
 for <ltp@lists.linux.it>; Wed, 30 Dec 2020 19:37:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rtUb4VfrOiXtE8/EIfpP+FxgrB9VmLlXC3CgBSk3ZFY=;
 b=rHel3O3Rmbru+zmFFxpU3dOf7OXY8hKHo/hC2RNb4s6PHdF2U47VwvYRhJHblzbCx7
 HsJPXa8dc+R48g9El1kgSU5mEWAzWAiuLaz40gjtzE7f30iJGyq2XInlfvlGD+loXthP
 GVNoYvrH/e7ZSLzGjrWNWyoxN3+ZfUws7s0m53moBhpzFGWZf4a+9bl5o2JXm6RGW0yC
 xFh8Qv4YOAKRNMnni2hqSFGe3g5k2gxNaxeVrWrfqLJ9FgKU/JFSte2yjKr6v9aYp6o8
 MVtNN3Yk5XHDgUceuFQg1q5e985jij/G8vKPkyz8YfsRj6NFOYiUK8XDkvaFI23niVF2
 O06A==
X-Gm-Message-State: AOAM531UqWHLIz+kv3QjHVKmYksvAMtYS/dtbrre7XCXRCzOyjC/f6pb
 4ya8o6DekLBTMiudPTHBXK0YnJcjk5fNarfNQNaJycCcOM4c5SO6A/h9IbbFlLH9C2/1ZW263kz
 T93HhZXJw9lorL0wcUgjhK6c6PRM=
X-Received: by 2002:a25:c7c6:: with SMTP id
 w189mr79566203ybe.403.1609385855354; 
 Wed, 30 Dec 2020 19:37:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuxl5l7ZyzZWaSqcPLThCK4M7SvQ76wDHSys6KiSHO+igcQ3pzh0fvQcaQVhE2KWysgINjWJDoQ1gTBRgmP+s=
X-Received: by 2002:a25:c7c6:: with SMTP id
 w189mr79566195ybe.403.1609385855181; 
 Wed, 30 Dec 2020 19:37:35 -0800 (PST)
MIME-Version: 1.0
References: <20201230163615.318-1-bogdan.lezhepekov@suse.com>
In-Reply-To: <20201230163615.318-1-bogdan.lezhepekov@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 31 Dec 2020 11:37:23 +0800
Message-ID: <CAEemH2dhF4jFKZnHAiVKEhMuacnxzLYaaom5t+Q0eY4SSjHirQ@mail.gmail.com>
To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
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
Subject: Re: [LTP] [PATCH v1] mem/mtest06: mmap1: Limit distant mmap size
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
Content-Type: multipart/mixed; boundary="===============2025661774=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2025661774==
Content-Type: multipart/alternative; boundary="00000000000034736c05b7ba58fb"

--00000000000034736c05b7ba58fb
Content-Type: text/plain; charset="UTF-8"

This patch makes sense, merged~
Thanks.

-- 
Regards,
Li Wang

--00000000000034736c05b7ba58fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">This patch makes sense, merged~</div></div><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr"><div class=3D"gmail_default"=
 style=3D"font-size:small">Thanks.</div><br></div></div>-- <br><div dir=3D"=
ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div=
>Li Wang<br></div></div></div></div>

--00000000000034736c05b7ba58fb--


--===============2025661774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2025661774==--

