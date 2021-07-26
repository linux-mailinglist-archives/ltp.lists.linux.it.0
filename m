Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD77E3D55CF
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 10:44:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C9933C9229
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 10:44:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6661E3C65B1
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 10:44:13 +0200 (CEST)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2E36A200075
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 10:44:12 +0200 (CEST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 28D513F343
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 08:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1627289051;
 bh=pALJPYJN2WtZ/LhvcpgIUbs/uL4SvHCdEFHkVivG63Y=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=n5Y7LDuULXeUdQLRSGzyGJtFf3T+u4jrl5y7PBP9+TM2ekCZ/myBL1pM5+RH6LChG
 e2fvrlEDBElNHOTij+i88NSGxQ+85ag7HDR76jRFiFVfkMwUul7KFHpLWqBGcChURX
 5D7rPgUU8dXPoxZGMUK088Xv1+QyLGGW7eHwrzMO2xaC2nJDSI+DCVMSj0BZRmi+OO
 Lfr+66uE5v9X614z0oZtHoOIpWpwowZeaDDcGFME4Kmq1HUEBpwYn88x9fd1hwPwxY
 f0tak2Yo2ixHAyEA0G8DOwCux2j+8jxUrWumsVjL5GBfxdqiQXMuDHBvDwVzLB7mrC
 X/gO4rItXDVjA==
Received: by mail-ej1-f72.google.com with SMTP id
 c18-20020a1709067632b02905478dfedcafso1809093ejn.21
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 01:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pALJPYJN2WtZ/LhvcpgIUbs/uL4SvHCdEFHkVivG63Y=;
 b=CQixCuzOM+CZ+ocuHI3ScVU+ZEQjmCTMcC8D+jyalAWJyWTjSXWj8r2XUCXNwHgY2r
 Ivxww86j0gWOPe23yvVhS9YFejI51IMtWhgTyIQPhwGx2NlWIDirI7lWWvIm9ZOgIUf5
 0ncvgN9e6bMivVICCQ0fokhwd7L2k0unsnut0d9kUZ0ejis94/qZzit+cI6I2dL5iT23
 CJvKiR/Bor5rmvHPDRylE3Xn/5ozTsg3ahvsEGRGtReuSP7kCkHl6QdgKiaqiy7Cka4G
 22bEEkuH0BslQVUrtUO9LCcYyRlP2NiCDO1cSIIKnu+bvhyeqEaUh7jXMpmyDsLCPDkM
 b3hQ==
X-Gm-Message-State: AOAM530TX9tIyUu1b2xwvyryT2m1aGgRw+Vk3g8nDZOCN2rcrJUBppP5
 RtUewNr8IFYNYlbiBSQ7sTbQbO7uzr4fIAgAvdZiKCgUryTZRFtYWjZdkJd1/HC4T3k5JEJAEC2
 b6nqxCTYn66vFJtXB14C7ku7TeyBO
X-Received: by 2002:a17:906:2541:: with SMTP id
 j1mr16528201ejb.128.1627289048975; 
 Mon, 26 Jul 2021 01:44:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiz/QnGpu07AEkSriJEWv3EnSE3Uk0/uWFqbIwcStGbZXIbUfkXoLaWTfYVBKCaIuJWoW2Wg==
X-Received: by 2002:a17:906:2541:: with SMTP id
 j1mr16528194ejb.128.1627289048814; 
 Mon, 26 Jul 2021 01:44:08 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
 by smtp.gmail.com with ESMTPSA id t15sm13951303ejf.119.2021.07.26.01.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 01:44:08 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>
References: <20210401125127.45600-1-wangxin410@huawei.com>
 <YNoxKg+Hm0qa3Z70@pevik> <fd26cf45-7dd8-004f-3d41-422ce4d9bbdb@canonical.com>
 <34bbe196-515c-f4f3-6d1c-5c9f1221e52a@canonical.com>
 <ca6ecb17-c1b4-0d8a-a3c4-dc5e8e2bd275@canonical.com> <YP50+GkBceVIr4It@pevik>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <d0175bb9-d15c-940c-14ac-a67f34d0da48@canonical.com>
Date: Mon, 26 Jul 2021 10:44:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YP50+GkBceVIr4It@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ltp_tpci.c: Add release operation before
 allocation
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
Cc: Wang Xin <wangxin410@huawei.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 26/07/2021 10:40, Petr Vorel wrote:
> Hi Krzysztof
> 
> ...
>>> Is there anything stopping Xin's patch from being applied? LGTM:
> 
> BTW does it solve your issue "tpci: accept ENOMEM resource failure with
> virtio-pci" [1] ?

Yes, it solves. My patch can be dropped. Thanks!


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
