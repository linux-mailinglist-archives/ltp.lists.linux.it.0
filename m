Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9F63874E0
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 11:16:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0286B3C87D1
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 11:16:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3F98C3C1E1D
 for <ltp@lists.linux.it>; Tue, 18 May 2021 11:16:56 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AEAF960115A
 for <ltp@lists.linux.it>; Tue, 18 May 2021 11:16:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621329414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wv5J+JCUYzP2CwYwSVeYtBnBiHvsWLjBk0O6ma8Jr4o=;
 b=MsT6VtaIXDXFp1cVe8/GF55Shx8KKM3WxCyIV+PvS5eU/GBRLx4DHPIGyQw2A3S5yHgUQ+
 iCcmSyZQkS4bP2IdoI1J9lCr/unVR0IknxodaznoyRZZgj0RjrwL+5cpQwoZPIXZQGdaO/
 3TCFkEoJaDr1Cb0kiqRDZRkxtaW1oq4=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-Q4zH6-yXMmSUwzommvOg3Q-1; Tue, 18 May 2021 05:16:52 -0400
X-MC-Unique: Q4zH6-yXMmSUwzommvOg3Q-1
Received: by mail-yb1-f200.google.com with SMTP id
 a7-20020a5b00070000b02904ed415d9d84so12957258ybp.0
 for <ltp@lists.linux.it>; Tue, 18 May 2021 02:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wv5J+JCUYzP2CwYwSVeYtBnBiHvsWLjBk0O6ma8Jr4o=;
 b=b0L7DyEXENekFDjvlWhGO4oOIo3b/4TQsq6O5yrhbMEHZG6dMHZ0nVaGMf1c7QC8i9
 EpbK4kw/JfO0ZD4YJCPLt/cBj3SF49HH6Jx6oT/2YlBjUihEnLRVsg6+OTTqCaSM9i7X
 +o0zit8tlkTgyCLyjIsAaWEvpI9wrQH23npV1fWJqxm9mhsuSW2fK/q2SjsGKTq/fh5u
 5ptt2x8OHP45wXa0yQz5/H6PZZRZLbIypuMQN5+IknOX79ZIQfW2sDZy2CeI6m+45ww2
 N6EYjic92j58b51wfKhfd0+c5iEKSuMEQp/ZJ0GaFNkckNHJkJKbVLG0yhiTwSBWQXKx
 2hTg==
X-Gm-Message-State: AOAM531LVXFarNBYzRZrrU3VkKYRKtWXsz37Ld/b/o5Pjmf1onegg+qz
 cd/g0Cbfij94Bx96pVxmbYCBl+EbrzHRsYej6YkhjtRXw6tZtlLR7m5jZJWugLA8WuxAqKwSWgu
 DX97ph5m49qgUxxhcFOnCVgBApbk=
X-Received: by 2002:a25:ae24:: with SMTP id a36mr6228392ybj.97.1621329411668; 
 Tue, 18 May 2021 02:16:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbx23DkJJwc0ZjZyzXboYtUB+auHlPTagF3rVbnqvNnoEJzdoIMTYf4z7lemg6sZXUkwpLvqzC1vt+OwtQEO8=
X-Received: by 2002:a25:ae24:: with SMTP id a36mr6228371ybj.97.1621329411537; 
 Tue, 18 May 2021 02:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210517163029.22974-1-rpalethorpe@suse.com>
 <20210517163029.22974-3-rpalethorpe@suse.com>
In-Reply-To: <20210517163029.22974-3-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 18 May 2021 17:16:39 +0800
Message-ID: <CAEemH2f4uOzFgfsxZJP1Qsxzz1eQwYECSx2pDXSu5fJYBc32=Q@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 2/6] API: Add tst_ to create_sig_proc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, May 18, 2021 at 12:31 AM Richard Palethorpe via ltp
<ltp@lists.linux.it> wrote:
>
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Reviewed-by: Li Wang <liwang@redhat.com>

--
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
