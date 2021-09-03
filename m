Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1552F3FFC5A
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 10:53:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A96F53C2906
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 10:53:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EE8D73C2833
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 10:53:32 +0200 (CEST)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EBBA8601D5A
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 10:53:31 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id l10so10403009lfg.4
 for <ltp@lists.linux.it>; Fri, 03 Sep 2021 01:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SzTneoinf4INKQwqmDyd2gOc+eF/v2spO/9G0cpfqCY=;
 b=Ouqf9Z8jA8WzwTT3ZBIGuPNSh5QTVK8/cYLgJqJlIs9aac25w8X+8Q7kubzNmdJtDn
 o42zw3CLSvMFWJyIhd376TjYl+K3ZgZHOpKyYA0amVks4LXdDzBPDAMv2hwhQq3vKxie
 ZAB0n/K7b/ZEjBepGEm9cmkTpaTOSj/H/vkjCKXVBMj2Hj0PyHhjLLGtm8mLAteg0zCf
 qICQk1Uqlv9sUHK+uTgQqfsnQI7qHvPHlKc32/fAKxvDqH99mBK/F8a5qLPDNfTGiR+T
 CGbbt0rqzHYB5bx4Hoa75QAaigWtKXPA1Y8lbF0Bti5njRGLWYFArIc+zy7ZSJDTqzA9
 QW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SzTneoinf4INKQwqmDyd2gOc+eF/v2spO/9G0cpfqCY=;
 b=UyfejcKNyp/vV1Zyug9g0Rtl/QSvVWdhyQ+UZok72L3YPRaQ0f7ogUPWfY2n5RMin/
 t0fU79TKPeLP/2kw6YN6zJFNOVUV/37EO8b+q6uyzuey3/sdqfM4VIxxM8klH6GsJaut
 BXatshpeBBzGF4ZUQfeOLLu2cTrRNf+hQywAuAS1HM50UbYa9nKZllNXJ2HLYF2HHv/T
 4bYhhFrfNHbbdEbu9UraoNb6hCD7BOXfRwDYLgu7y6tx++n2F2nacg/jnU4ZnW8VGJay
 2AX6W3jrhKhZLUZaDo5V/rJTrMy6dQyb57DAsZ86N9i8fPbdctZtgvNTqP/35/zBhkSb
 gNcQ==
X-Gm-Message-State: AOAM531DNIa8GXQhAue21AhE6JT+Ev0T2FbwWCkBfd692hw6QZ2Z8PIj
 VCrhehCG1w045VS2th1Y/XGo+vaRDMHI
X-Google-Smtp-Source: ABdhPJwNbKRwzN+ZnVeAw9CA29AeNLOyF0Tu5JoENHDDrerrb+QlkvuFnrlDW1za6OahB665oHdHmw==
X-Received: by 2002:ac2:4896:: with SMTP id x22mr2018107lfc.159.1630659211034; 
 Fri, 03 Sep 2021 01:53:31 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id h17sm511829ljg.131.2021.09.03.01.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 01:53:30 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>
References: <20201116220325.413764-1-pvorel@suse.cz>
 <689bea29-9717-1b2a-a53f-4b3a7f9f4e9b@oracle.com> <YS9u/k/b7lM/l1ki@pevik>
 <a07de84c-5251-9e46-afac-84544247534b@bell-sw.com> <YTD/rU/ohgp8p5Zc@pevik>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <a0b2df49-b8bb-6968-fed8-50ff3fd33543@bell-sw.com>
Date: Fri, 3 Sep 2021 11:53:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTD/rU/ohgp8p5Zc@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.8 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] net/route: Rewrite route-rmmod to new API
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
Cc: ltp@lists.linux.it, Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,
On 02.09.2021 19:45, Petr Vorel wrote:
> Hi Alexey,
> 
> <snip>
>>>> BTW, why not using add_macvlan() in route_lib.sh (or gre, vxlan, etc.)
>>>> and remove that driver, so that this test can be run with custom setup, and
>>>> with remote host setup?
> 
>>> Looking into this old patch, it looked to me quite bad approach to move
>>> add_macvlan() into tst_net.sh to be reused (you didn't suggested that, that's
>>> what I'd do to prevent the duplicity).
> 
>> Why not move add_macvlan() to the virt_lib.sh, I think this lib is better
>> suited for creating macvlan?
> Well, route-change-if.sh and route-change-netlink-if.sh depends on helpers from
> route-lib.sh. Using both libraries would require little changes, but sure it's
> possible (+ add obviously add $virt_type).
> 
> It's just a bit strange to add this special purpose function when there is
> virt_add() and virt_add_rhost(). Best will be probably to add macvlan to these
> functions and migrate router tests which needs macvlan to use virt_lib.sh before
> route-rmmod.sh using it.

Yes, it would be better to have the generic ones, moreover macvlan01/macvlan02
tests are already calling virt_add().

> 
> In the long term I'd really prefer to add some TST_NET* variable (due doc
> generation via docparse), but that can be postponed as another effort after the
> release (I thought it'd have to be in tst_net.sh so that tests does not care
> about including virt_lib.sh when declaring it, but variable could also have
> prefix TST_NET_VIRT_ to make it obvious, that virt_lib.sh must be loaded. But I
> still prefer moving to tst_net.sh when implementing this approach).
> 
> BTW you consider ok to use macvlan for testing this? I suppose this test was
> intended to be used on the real hardware not on virtualization. But I don't have
> proper setup and give up on this approach.

I think we are not changing the purpose of this test using a virtual
driver. Using the real drivers would complicate the test setup
unnecessarily considering what it does with the driver...

> 
> Kind regards,
> Petr
> 
>>> But much better approach would be IMHO to move virt_add() and virt_add_rhost()
>>> from virt_lib.sh to tst_net.sh and adjust it not to be too tight to virt_lib.sh.
>>> I suppose $virt_type should became $2 (second parameter).
> 
>>> Also there could be moved from virt_lib.sh to tst_net.sh: e.g. add flag
>>> TST_NET_ADD_VIRT_TYPE (e.g. macvlan, gre, ...) and doing setup and cleanup
>>> there. We could reduce code and document which virt drivers are used.
> 
>>> route-change-netlink-if is the only test which needs to call tst_init_iface()
>>> (to add routes), virt_lib.sh does not need it.
> 
>>> Kind regards,
>>> Petr
> 
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
