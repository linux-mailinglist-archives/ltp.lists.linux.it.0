Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EA390ED92A
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 07:54:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 396153C2454
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 07:54:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 869B13C2445
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 07:54:33 +0100 (CET)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 49C411A000F1
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 07:54:33 +0100 (CET)
Received: by mail-pf1-x443.google.com with SMTP id r4so11509955pfl.7
 for <ltp@lists.linux.it>; Sun, 03 Nov 2019 22:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=g3KeD+fpMe0PMu2Eixj93UHOaB5uL5Y37C/nJLyUgi4=;
 b=WPm4nE88pf6m7g+X0tiDq12UjZpnTRIAbd/ub/UtMHQfPV/2cU0w7huGcX7T4oovXV
 aXr6FAGOgmT+r4vOs973f07Wjp73+z3TdAjrBvIzouMhSer3HHiIjynAsiaqoraVxdqy
 9lKPE0ynNEHvYbblT0NIRbfOMWoTsqWbaYuauJulzK1LkDd/Rj77Cjv52kSdDNv/YDcz
 1ybw4cCNYdKDLQ2aRal9L108n8Msq2tLY20SMlTnYTT5z/yYxttXr2UsinNdRABPgYcI
 ke854h8rCPWy/Spba+/64CB2HN+qdlVfvh6+j7OV6xIjn+Q8Rglb0IPYg1IVjMyhFoJX
 emKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=g3KeD+fpMe0PMu2Eixj93UHOaB5uL5Y37C/nJLyUgi4=;
 b=NImZA3fXIF5RytVLwsU9Z06UhgHB1pmgKRywlKW+tHuStVlExGNrveLoKKaCSTQpqN
 /EaYJDoADuDAtHWvl5YpD/1rEl0qJ8gBktYY2tsNsiKgSjyoEhMMRuWyrJfWSzP7GGia
 Ppvnn1tU9FHPjgzHEaQnTDHy/Ik+uRluHXh69QdPa+DaktlIQ1jKSyX0wIMKrXF3CQse
 5t4V4hCk8VL+685lexrgojfKDLDsPr1kW1SlBDPSyNpkMBAgZwjm7A72atUnxwYz/eG2
 oV8T/p//TRJLiJLGA/vtykWlnIV/Qo8IfZ6VoPuASVwt9WTlSzbqwiAJL+AOZewR/hwI
 BzMQ==
X-Gm-Message-State: APjAAAWpTGHZjkXjv11Icbr6pN9Oru6WT1CQ68M6+G1ijXJBSV0CloLN
 8qgoQacfbrsJ8p0gA+XeVjM=
X-Google-Smtp-Source: APXvYqyvRwoHf/x/bVFjuBUaQ1QjIAqzxek3GLZT4PMnr/VN/nMcnvx7V5MqjlWiSRKpL5CvC5miLg==
X-Received: by 2002:a63:b502:: with SMTP id y2mr20750247pge.133.1572850471651; 
 Sun, 03 Nov 2019 22:54:31 -0800 (PST)
Received: from [192.168.20.12] (c-73-19-52-228.hsd1.wa.comcast.net.
 [73.19.52.228])
 by smtp.gmail.com with ESMTPSA id i11sm13910158pgd.7.2019.11.03.22.54.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Nov 2019 22:54:31 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
From: "Enji Cooper (yaneurabeya)" <yaneurabeya@gmail.com>
In-Reply-To: <20191104064119.11510-1-pvorel@suse.cz>
Date: Sun, 3 Nov 2019 22:54:30 -0800
Message-Id: <BDDF3071-8590-4869-BCAD-458E58DA1CDD@gmail.com>
References: <20191104064119.11510-1-pvorel@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
X-Mailer: Apple Mail (2.3594.4.19)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] build: Remove {config.h, config.mk,
 features.mk, }.default
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


> On Nov 3, 2019, at 22:41, Petr Vorel <pvorel@suse.cz> wrote:
> 
> Nowadays most distributions have autoconf, we can require it.
> 
> include/config.h.default was outdated anyway.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
> 
> BTW INSTALL needs update. doc/mini-howto-building-ltp-from-git.txt is in
> much better shape, but contains just compilation from git.
> 
> I'd either create single markdown page doc/installation.txt, which would
> contain both installation from tarball and git (preferred) or had 2 separate pages.
> 
> And INSTALL only contain see doc/*.

LGTM.

Reviewed by: Enji Cooper <yaneurabeya@gmail.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
