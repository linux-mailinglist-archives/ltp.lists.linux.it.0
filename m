Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97275374DF6
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 05:35:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3BADD3C2170
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 05:35:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D4E793C0207
 for <ltp@lists.linux.it>; Thu,  6 May 2021 05:35:33 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EE4DF201025
 for <ltp@lists.linux.it>; Thu,  6 May 2021 05:35:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620272131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oiWiRifBZ0Fm8i0mioeqeOOOh5/rP4X6FsAW2YPTu1A=;
 b=EEgviXRTOWBIatDUhTtB7q+OlQhDu9YE7afQYtugARVGDYsYaRqu3pd3kWWnHbbF9udovt
 K8KRyYCPxkm/24dlrlcSHoBtB8qOeT4aLTF0ddIiXdQxEnkjbsvI8UC7gw+kX6VmbwrgOi
 3wmIBUBbr4tXLFe7RwM9Io1QrNOny8k=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-wZpg6PwOMwCmD1KL9NPC8A-1; Wed, 05 May 2021 23:35:29 -0400
X-MC-Unique: wZpg6PwOMwCmD1KL9NPC8A-1
Received: by mail-yb1-f197.google.com with SMTP id
 m1-20020a2526010000b02904f4d04c0f14so4583435ybm.19
 for <ltp@lists.linux.it>; Wed, 05 May 2021 20:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oiWiRifBZ0Fm8i0mioeqeOOOh5/rP4X6FsAW2YPTu1A=;
 b=JORIkl2Z5J8uPknH5WJzY7mSgUD+gdCDg4yUb4CjnIhvGqXYdiCl6MeGVagbM1srzy
 moWpABillMT/5XxtYGAn1RJwDAzqdYV4ex/SG2xV+7hDLp2eskRR+80rmtM2ZQDLZYnj
 MOkhoBRDB2N5zdwpruiUroXnyc5KqbuY0tSxzcNKiMha/QB3TruBixJb340cl8RoFj8H
 FRJvdNFJU04VnAs10ECcclXra66x+hoIceFKbe/k4bwQBNQTIgkuCqHtQz5AxyMs3lnb
 oZQierob9v8z5nolvRaZFEj5smjpNQXOA1imlIiQdNX3wX7f3uYqZmQHf5b0dUp6Ov8b
 t/gQ==
X-Gm-Message-State: AOAM531R8dXjt+w12+8/28S45TtNzCQZAyuQAz4rfDl2vE8KkcRkngK3
 qADEK1GVn7NqX9ii/wBR4rLQgSnRbc0ya5hBbkRM2OwJL3ltAiApFaATvzCxp2KmoJZ1/PZngZn
 I+4fVhbQWZmiZmMcOV5tRsOU3SRk=
X-Received: by 2002:a25:27c2:: with SMTP id n185mr2801076ybn.110.1620272129242; 
 Wed, 05 May 2021 20:35:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxugImzUnSeOwVlt2qPHk1arOyJr3BX2MBRdeEBSGSlH2zHKr6crM8L94ji4My3IoSZuJc0sGfMj4sZ+Ke3wc=
X-Received: by 2002:a25:27c2:: with SMTP id n185mr2801058ybn.110.1620272129037; 
 Wed, 05 May 2021 20:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <1619688106-2179-1-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1619688106-2179-1-git-send-email-xuyang2018.jy@fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 6 May 2021 11:35:17 +0800
Message-ID: <CAEemH2f=DHVdeROr7TL1H09a=4C-cmqKQaAgmrq=qBYPoqFu5g@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] openposix/mlock_8-1,
 munlock_10-1: document the introduced patch
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

Pushed, thanks!

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
