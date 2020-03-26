Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 14926193801
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 06:42:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA4713C336D
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 06:42:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 1B7EB3C3361
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 06:42:29 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 2361F1402C70
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 06:42:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585201347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wB4n81Ihropnqru8/sopM2QH0q+P+KZuDzdZXh78LtE=;
 b=Wk9u1RlLYa/rYeOfzrFneuVuBIkvAZjCou9Nlp0B6SsPV4Ov9ZFOs4uOBGxMZ1Xr7WY9G0
 g4fyC1durPvW5rtPsS5OiJxM4SpT7xPT0eILvjA1qF1Q4PVB6S9MNCiOtVsLcjQZ9Y1GzG
 vOBD7qvCpaAb+DpWCHykAoWhoKVewjA=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-5G0BYVHoP4GBnl9Z-clLAw-1; Thu, 26 Mar 2020 01:42:25 -0400
X-MC-Unique: 5G0BYVHoP4GBnl9Z-clLAw-1
Received: by mail-pl1-f199.google.com with SMTP id x6so3528688plo.13
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 22:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BFXI59ZvbxCItWXmm0u7LmnkSZaSsMlcSUwk3WLR7eo=;
 b=H86OaUKbuRzSTj7KVn9gHynVoLmds1yBlDZc/736FzEKDeOK4IGlt/QSwEcHkT4zf/
 zEPt4hoLD5gPOusITY/XlxvHwr6SGb2Y7ZEHTG4+LYwkBkSdoiufTTtx+2jx1mETu+kT
 ZOeDM//o6JYcqrJza3Oc8E0eUJxopMTlr5AGaTw9F5WYrwbXFqB423SbuvZHALd2P/9B
 +Xi4GcTYp7qriaUvpi5Q/FL9fzgf9wLm1UL51hJPMV3J1aUu/615K0nU5hMva7mDX5pC
 uTxYIiRKI3TPs37mhc8Npay5dlwm67vLmne2+kwFZ5T+Lt5BuZmC8fkRNRqkFkxsBZCJ
 8N9g==
X-Gm-Message-State: ANhLgQ1Cfo7FYE2c46k+obEHiUoRj4hQIxIvdD/rRj/pkXo4o2MyyQg1
 xtPB528iRFWGD+MWD0wk8HXzFsje3pB6SKipenM+y835QHHUHnATugbQxO8CwnDPkYFAS3762Gf
 4TI9CE8AB9sU=
X-Received: by 2002:a63:a35a:: with SMTP id v26mr7159546pgn.40.1585201344698; 
 Wed, 25 Mar 2020 22:42:24 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvX0C0HgZJvJuZk6RlSzXQZJ/MhfhK1/OPWE/Na03EPHidcb9skEGS8KqM+HEATE2JF+YGc8A==
X-Received: by 2002:a63:a35a:: with SMTP id v26mr7159529pgn.40.1585201344345; 
 Wed, 25 Mar 2020 22:42:24 -0700 (PDT)
Received: from gmail.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id l127sm696889pga.94.2020.03.25.22.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 22:42:23 -0700 (PDT)
Date: Thu, 26 Mar 2020 13:42:14 +0800
From: Li Wang <liwang@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200326054214.GA26570@gmail.com>
References: <1585192647-16105-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1585192647-16105-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] runtest/syscalls: add sendmsg03
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Mar 26, 2020 at 11:17:27AM +0800, Yang Xu wrote:
> Also, fix a possible warning in cleanup when SAFE_UNSHARE(CLONE_NEWUSER)
> failed on 3.10.0-1049.el7.x86_64. as below:
> 
> sendmsg03.c:43: CONF: unshare(268435456) unsupported: EINVAL (22)
> safe_macros.c:67: WARN: sendmsg03.c:65: close(-1) failed: EBADF (9)
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
