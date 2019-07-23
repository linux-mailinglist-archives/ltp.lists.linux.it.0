Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D0F71D3A
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jul 2019 18:59:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E22173C1CF3
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jul 2019 18:59:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id CD42A3C1860
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 18:59:41 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1475D1400773
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 18:59:41 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id r7so19447381pfl.3
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 09:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=92oaRarwwa/XxYrp1cSWyX4HysRrRkXNq1HP7r+LaaI=;
 b=i9BCqdAdbmNUF/VM4QMITB32FyA6tazdmV5aLE8TPAiRK7LHBq0Z75pXlByB+kjXqK
 l/zsgqjj0khUaPRbX9ZpZ9bcWkHzEfZBfTnIwW+F5/49ghXTGmX686D4bWfTKTo76IO8
 1RM/CITWAbJjBoDl2ThTM5UZ5FAkxg8ztBX6LA+qlf+xjmeRCPd6bMBMKISoO0Y3icCG
 e+LwAccM4SoCyhb6wCFdiYtx8q1ZumoFCkqTJ0lxp5I6/VVLYdm5yjin9cAnVngM13NS
 W9M3IifYr8qJ4rLElOsvIfPcRIyjT9jmXJ6zJGDMYDonVwbIyHYCWs0TgLUnbZNSeNp9
 0r9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=92oaRarwwa/XxYrp1cSWyX4HysRrRkXNq1HP7r+LaaI=;
 b=ollFiHW2y5xsCGG/g/L8cuVgAxVUSU6uBI65oYEmASOvIfjIKnRl2Ir8mUFmp31b5T
 RMS/SXAWZS/4GjxSoRq8DXtfYvWaQLDwFtTx+UIe6mWx7+eV1oBrTz020TInXbW8QWKM
 bAnUDwWwxBmk7BmEL361OjQmbHXV0EvvYG2LHdK+cxQ2l61ihwaPwTyGPnXRvW1bP7f+
 UkhpfFSUtO5YQNQs2B1KdXU9UxE5/tr8lildlYbcYwK+xOyuv/+BMGEAdM0PSblnR059
 3bllw9axpvT0qMLupHsddsVIrglD6OLVGsY8Cp4NfLfKvMgzMRm1OXvd38C6Ps+7fJyL
 jAFA==
X-Gm-Message-State: APjAAAUSVZm1pkh9CKZjrc+bqhqka+eaZF3VeGBqOd3AQmquX9rgG69N
 XPbYnuFFoyXkLmBCDa53/DLk9v2lp5OTvg==
X-Google-Smtp-Source: APXvYqzDTanN3jcVwHeAZvbXYll5/0x6XEPQcXppHaeAKmHTVg75uLdvNYNu5mUW/9BEBsuK/lKwPw==
X-Received: by 2002:a17:90a:9bc5:: with SMTP id
 b5mr83841585pjw.109.1563901178613; 
 Tue, 23 Jul 2019 09:59:38 -0700 (PDT)
Received: from smuckle.san.corp.google.com
 ([2620:15c:2d:3:d440:a026:9220:62ba])
 by smtp.gmail.com with ESMTPSA id g2sm38415737pfi.26.2019.07.23.09.59.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jul 2019 09:59:37 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20190419210637.88522-1-smuckle@google.com>
 <20190521144733.GD19326@rei.lan> <20190723123134.GA27487@rei.lan>
From: Steve Muckle <smuckle@google.com>
Message-ID: <41f99cb1-9b49-9e5e-a5d3-2b858a8a417c@google.com>
Date: Tue, 23 Jul 2019 09:59:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190723123134.GA27487@rei.lan>
Content-Language: en-GB
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2] syscalls/sendmmsg: add new test
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
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 7/23/19 5:31 AM, Cyril Hrubis wrote:
> Hi!
> Ping. Are you going to work on this test or should I take over?

Hi sorry for the delay, yes I'm just getting back to this now.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
