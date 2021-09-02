Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 783053FEAF2
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 11:07:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 190D63C4C1F
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 11:07:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F12C63C28B0
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 11:07:44 +0200 (CEST)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 287C6200DBB
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 11:07:44 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id c8so2785120lfi.3
 for <ltp@lists.linux.it>; Thu, 02 Sep 2021 02:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JWwgd0RWEBX18ocNIqcEmxG3JagS14bkH1QX3o+ss64=;
 b=O88s2RoKAjOEcFYtwNI1l7NRXOfM3mfnrVggqX7mV4AgxF4ZqG3UOtL8AplLYQ/bYw
 pvC/OBEedtagxnkMF2RMozWaVkToI/dgclXtWBd4THyx3zhLgCqNGxbHKMKVi0ypHVGh
 s2CSy/u2Eqx9g66H8wu23AmpkDFJAkGyqMF57nPJQhFqw8/Os7sh6tqzvmYIIbfzSJFs
 YPTnmfyDBWEci4Sun2OMTpWp81ort3N5MItFW0skr7WlF5e/GBqAwLezIC0HWMMFv8Zl
 9X1Ds/kEWZ84eDT5lK+Va2gXyHP2PUfHaEYIG9VYW2pWpG7/GMRWmpcaCq7zDj30rWMK
 Z6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JWwgd0RWEBX18ocNIqcEmxG3JagS14bkH1QX3o+ss64=;
 b=rSc4g8nGZK6wkNrvihpoZi/yf9rt1CDH9p/Nxn48RzBMK5vKsjyeVaL7PYMwfPubET
 N40m9lBYNeEuCGPKrfzEPv79IPYXlKjw+bDBYUoqJfjBkb90D3ICYwMr1DqmzWB3akl5
 E6XV7aJdI8iun0vy4tlv8BjTPUiL0/jGHKqQ0W+ED2NO5m1EQMaqqJWqY0J5SLNHSmuM
 JX3MbJ/JBBepGNZy/PrqQE4Ji9TvSViekEmM8Qn87/yWDaanCPrOHX9VQjtggtrRqtdT
 m+khr3thqKL02iTasR3zdLC52BiWF+MQTjNbi9bYstplwYIeuzUNpMqXMVYBy6Pv/HtR
 y27w==
X-Gm-Message-State: AOAM533nfhJbmBGU+dPwxSF/tqZHb53dWH1E9KG3Jdmrd+yZSEn43+0X
 IRTp19NlkIBOCGHYAoZqhQT8oq4/SkYY
X-Google-Smtp-Source: ABdhPJwRJESgKQcbtwtJuhqkrjNTb0YKHo4XbyV+qpJUODRx9xnnI1A1JhHLBzsQBX9n3QkpJ3Wzdg==
X-Received: by 2002:ac2:44d9:: with SMTP id d25mr1815601lfm.267.1630573663293; 
 Thu, 02 Sep 2021 02:07:43 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id e1sm140397lfj.85.2021.09.02.02.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 02:07:42 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>, Alexey Kodanev <alexey.kodanev@oracle.com>
References: <20201116220325.413764-1-pvorel@suse.cz>
 <689bea29-9717-1b2a-a53f-4b3a7f9f4e9b@oracle.com> <YS9u/k/b7lM/l1ki@pevik>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <a07de84c-5251-9e46-afac-84544247534b@bell-sw.com>
Date: Thu, 2 Sep 2021 12:07:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YS9u/k/b7lM/l1ki@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
On 01.09.2021 15:15, Petr Vorel wrote:
> Hi Alexey,
> 
> ...
>>> diff --git a/testcases/network/stress/route/route-rmmod.sh b/testcases/network/stress/route/route-rmmod.sh
> ...
>>> +setup()
>>> +{
>>> +	tst_res TINFO "adding IPv$TST_IPVER route destination and delete network driver $ROUTE_CHANGE_IP times"
>>> +}
> 
>> It is probably unsafe to go straight to the do_test() and removing
>> the veth... it would be nice to check that it is indeed using default
>> ltp netns, and veth not used for other interfaces, TCONF otherwise...
> 
>> Perhaps in init_ltp_netspace(), create a special symlink in the if block,
>> where the default ltp netns created:
> 
>> if [ ! -f /var/run/netns/ltp_ns -a -z "$LTP_NETNS" ]; then
>>    ...
>>    ROD ln -s /var/run/netns/ltp_ns /var/run/netns/ltp_ns_default
>>    ...
>> }
> 
>> then check via this function:
> 
>> is_ltp_ns_default()
>> {
>> 	test -f /var/run/netns/ltp_ns_default
>> }
> 
> 
>> BTW, why not using add_macvlan() in route_lib.sh (or gre, vxlan, etc.)
>> and remove that driver, so that this test can be run with custom setup, and
>> with remote host setup?
> 
> Looking into this old patch, it looked to me quite bad approach to move
> add_macvlan() into tst_net.sh to be reused (you didn't suggested that, that's
> what I'd do to prevent the duplicity).

Why not move add_macvlan() to the virt_lib.sh, I think this lib is better
suited for creating macvlan?

> 
> But much better approach would be IMHO to move virt_add() and virt_add_rhost()
> from virt_lib.sh to tst_net.sh and adjust it not to be too tight to virt_lib.sh.
> I suppose $virt_type should became $2 (second parameter).
> 
> Also there could be moved from virt_lib.sh to tst_net.sh: e.g. add flag
> TST_NET_ADD_VIRT_TYPE (e.g. macvlan, gre, ...) and doing setup and cleanup
> there. We could reduce code and document which virt drivers are used.
> 
> route-change-netlink-if is the only test which needs to call tst_init_iface()
> (to add routes), virt_lib.sh does not need it.
> 
> Kind regards,
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
