Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EAD9CFBA
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 14:42:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C320F3C1D17
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 14:42:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 2802A3C02A0
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 14:42:12 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9BABF6021C7
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 14:42:11 +0200 (CEST)
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0CB3AC059B80
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 12:42:10 +0000 (UTC)
Received: by mail-ot1-f70.google.com with SMTP id t10so10039860otb.3
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 05:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=rmO0S8RuqcTEdmBd48DgdhAPtCZPh166aa5AqEL6g7U=;
 b=D3q5oVf5DBW+H3a6D8vMfNK7gU8LAcgeggw01SPmVvcD+MojR9HByVw6rowGvEGndw
 VWpTdolk4i8M7vRmFJBFu/E4LxUQDXzRQhhcXGr4a6x03004MSSGzbWD9302OFd8Q6vO
 ER4fRrALE7GVdUyPwPbyuFF9qr/CB6XEOPmrFQWsfyCYkkrYrCLdapZpL9cTsa1S++oG
 SxMhuoGXIUujb9omHXabFJhLOGAVaSfvV8MgtSWXPmObT4I0fTK4wtsULZZzmf8d5ksL
 hpEH7d7Lrk6jVYajLtWqHyMVpNbCEjLso39yNSnxNJpgwfxzCkTzS0h+eXerBgQs7wzc
 lE2Q==
X-Gm-Message-State: APjAAAVSO0Ril/HxNn7cG0l0bFpxkda6uu70U7gPzoUJRbPx1sAmRdQo
 fN1HtuLK0ennzcvhlql6VM5LkxvXPFwWhi/Tg3pP4qub08jK1HfLRlQiYtqninKGe+x+9Gm8cCs
 eSYXcDX35iyxXTC3eiclvVm6GiE0=
X-Received: by 2002:aca:3804:: with SMTP id f4mr11705422oia.144.1566823329292; 
 Mon, 26 Aug 2019 05:42:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxuxr6Sdf6vIBEX6nWQ/dCyKpNJRNfLVPQck7OHX1sOqkEQuJbt4bxOsUTXCrluL4T0CGA5B3pi3KCVjjjIiw8=
X-Received: by 2002:aca:3804:: with SMTP id f4mr11705396oia.144.1566823328835; 
 Mon, 26 Aug 2019 05:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190808054513.31041-1-liwang@redhat.com>
In-Reply-To: <20190808054513.31041-1-liwang@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 26 Aug 2019 20:41:57 +0800
Message-ID: <CAEemH2fLGt3oYdt6k5uN5pE+3LZQHQabJ+CG-Tj=zphWadjTVQ@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] move_pages12: handle errno EBUSY for
 madvise(..., MADV_SOFT_OFFLINE)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Pushed.

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
