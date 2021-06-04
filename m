Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D7439B5B5
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 11:16:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9477E3C4F3C
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 11:16:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ED8193C248C
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 11:16:04 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 757FC1A014C5
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 11:16:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622798163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YFPNrYlrgH3BRRciHGieNvsz4youLGTgVL1vxDq5QvE=;
 b=S/FWX4nl22AW7iWdmDodybfIvlPL8Z2cC+vO7JvDwxQuCeSPB4YSFqlL4RoRzOmPUlTaCN
 XYJ0osr9KiphELWXFfBtyE2yjVG3sr2hDVDz0twPCvrasazjdiTQjENKu59SY7DS3aDSx4
 fbfQ9JypyHeWt25Gl1EtZc2L89KkrWk=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-_wl-YSQ4M6OIK0ITUPS9JQ-1; Fri, 04 Jun 2021 05:16:01 -0400
X-MC-Unique: _wl-YSQ4M6OIK0ITUPS9JQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 s186-20020a2577c30000b02905353e16ab17so10864573ybc.20
 for <ltp@lists.linux.it>; Fri, 04 Jun 2021 02:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YFPNrYlrgH3BRRciHGieNvsz4youLGTgVL1vxDq5QvE=;
 b=tHY6Rmid6DYwYANUGNyl5uTpuNNGDIQ0MFLH1mrBSWmh29iv9TYvhnpkwqaAQkekYN
 53ZegJ8iYIhDiWHDUVfiuEUUk7HNSNNt+bK9qX9w16ByvuwSDGdnG3Fb35MR+494Mzvd
 s0wpgkV4M+uNcGrKlBx2xZQCetuNHem9ZoC7aKXJnRiiCnM/DUk5ZsIEEoPvRBBxL3CR
 pe3fDKJdfqueXrRqtl27zQodXUske1eaUQc0wYXudlmCAhhs1MN9A/ifqrz060TzPSRR
 6IM22bDFKLKAxiuvWuB7nNQqoyAgbVW9krrzEr1haQN6eaI3fhZJSsjfv/qOgrqu6hNi
 yMbg==
X-Gm-Message-State: AOAM533ZHVgOEqAI2/LPg7n3X1hAVfl21L4BIcyZZbA3hIfkPxwbH0fw
 BARf9P/HZoJkEqWFcRcJGzd8sGkwNRQzrllbopFzNCMNRaymn7D6RyIyr8jcPRiu3ML5KG+HtXZ
 a2EDv9j0TVRYt3xgvYdiy3QQraCM=
X-Received: by 2002:a05:6902:4a2:: with SMTP id
 r2mr4117460ybs.286.1622798161176; 
 Fri, 04 Jun 2021 02:16:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhoFITmCBhn0z54qi2u1gPtoARvzl1cn8lwKmDz5Q5A827YZIbX/dIr+IP81WS1a+Gbtx5Mmo58Xevr+kRf9U=
X-Received: by 2002:a05:6902:4a2:: with SMTP id
 r2mr4117434ybs.286.1622798161003; 
 Fri, 04 Jun 2021 02:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <YLh9jvI/p/VxsSmx@pevik>
In-Reply-To: <YLh9jvI/p/VxsSmx@pevik>
From: Li Wang <liwang@redhat.com>
Date: Fri, 4 Jun 2021 17:15:49 +0800
Message-ID: <CAEemH2e8h4tOtJ6Pfi7yYm8q=ZT238idmwjxWkxKh=pQzBNshw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Remove disktest from LTP
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
Cc: Mike Frysinger <vapier@gentoo.org>, automated-testing@yoctoproject.org,
 Xiao Yang <yangx.jy@cn.fujitsu.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> does anybody use testcases/kernel/io/disktest ?

Personally, I have never touched them at all.
So it's fine for me to drop it.

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
