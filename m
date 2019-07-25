Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E96A75BB9
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 01:55:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C78863C1D1B
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 01:55:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 0DC9A3C1C81
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 01:55:30 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BB0EA1000B47
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 01:55:24 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id g2so23542562pfq.0
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 16:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w3Z/wmUyfGlhm1khINQEdPwm7JTc5Chd/GFcgXDzZR8=;
 b=Asve4tNPjnLG++AkT31I5iR2GbHOI69jAiVm/PnQsBYsYeS09G/G2TdcdgqUyWNT3E
 pSmQCFBhLQbtwdkbHhpX3BnHLDyBu9sLuCUeDVDRtPz0XvSxnR7ilfjcPGm+MJ4KM9hl
 oetAzHGDNrKM7kozG1zLNVeXVPCn/TAWk0GDRv4crij93YVjaFRfYxoc+cmUbmxUQJ00
 iz8jsZXYyrYGYIyHmh5n+c4ldy4EpqwGN1D5qNNo1/ud5elHsdqHFZwFl+g9ill8LkqH
 F+9fMpFPcGISh20Zhx23jEEphzDcCFBdYrnZwqnjGYr9x3jkaRBbOABuLG8LKhC79san
 Z0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w3Z/wmUyfGlhm1khINQEdPwm7JTc5Chd/GFcgXDzZR8=;
 b=oPy5C/pd73SkNWSq+G2Cq/59cCTbLemUr7hcCNfp0g3Q0rymPzpLwELZ5Z2BZRNQIr
 H1Sbo7TeKfp+uywGyoufJi/hi00PByRsaixkbwk0A8JqVOW/zVqfsXCzetxfbeWSu74k
 cU5GzUOdUFV85ZiujJQ64lMAaVXbg8LOPQwhkf1hCHPmBydQkm8It/9yuLaZ7AxGrBYl
 NAxdVyoWuLWsK29Ebo/IG0xb6tKD48PhfO4Y+7vEH8cMK9ECP5N6SOWo9GW+hqFsPES8
 Z2s8Cc1Z+q05Ih8Kp8X21kgrJFnqsK2p5toElbjBQ/20NIzvc5DtondCr6hqr+K8Us7h
 +5+g==
X-Gm-Message-State: APjAAAUu6sSuGNA1RwJusiuXWDGzj5Sw2fqnQVMlJCwbiZbjAmvEwDV0
 5ckbthmH6AvGTxflrmLht1A0/g==
X-Google-Smtp-Source: APXvYqzeKg8kcZET/aIJjiCoIn/4OuZpIdMFuQntIXSoW8wHXeg4O+GOeLN9wo44BBo8wikIbDu/sA==
X-Received: by 2002:a63:e901:: with SMTP id i1mr71887102pgh.451.1564098927982; 
 Thu, 25 Jul 2019 16:55:27 -0700 (PDT)
Received: from ?IPv6:2620:0:1000:2514:1b4a:f4aa:2d85:6656?
 ([2620:0:1000:2514:1b4a:f4aa:2d85:6656])
 by smtp.gmail.com with ESMTPSA id 137sm62353261pfz.112.2019.07.25.16.55.26
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 16:55:27 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20190722194439.161904-1-smuckle@google.com>
 <20190723110306.GB22630@rei.lan>
 <1be1f0b8-170a-ac92-b86f-924e2d7f2295@google.com>
 <20190724115735.GC17426@rei.lan>
 <75ded79c-da38-b648-fcfd-a423cc5f0e89@google.com>
 <20190725124844.GB11617@rei.lan>
From: Steve Muckle <smuckle@google.com>
Message-ID: <e3b3658d-5698-5df5-81c7-d8946457c36a@google.com>
Date: Thu, 25 Jul 2019 16:55:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725124844.GB11617@rei.lan>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/statx01: loosen the stx_blocks check
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

On 7/25/19 5:48 AM, Cyril Hrubis wrote:
>> Perhaps the x-attributes are spilling out of the inode in some cases and
>> into a data block? I don't know enough about filesystems to say.
> 
> That may be, you can try to list these with getfattr.

This turned out to be because of ext4 per-file encryption which adds 
another x-attr, possibly causing the allocation of another block for 
xattrs. This wasn't apparent initially because the encryption xattr is 
hidden and not reported by getfattr.

I'll send out an updated patch.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
