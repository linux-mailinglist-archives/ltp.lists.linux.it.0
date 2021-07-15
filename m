Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C11453C9C08
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 11:38:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A8AC3C863E
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 11:38:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CB3CE3C65D4
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 11:38:06 +0200 (CEST)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B146B600F5D
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 11:38:05 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id 141so7893214ljj.2
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 02:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YbthgLQX6PVxEgsoPOJaLAIyrZtTBCWitjyXiVAZKFc=;
 b=ieDnR76VlnOYxx0qm1yXYlW43iIL27naKwhIyw65WWs280FFoK4f/HwZs3m7EWWMkc
 8mQNhEY9y25PVg3C6NxbdX9ZG8zbu1QviT/BcTW1Gxz8VRGCs/7VUUaYiqSDdFbezNqk
 mlGkw6BBgzqgWpEEHByDOMoXlV1VphwIvjIQZOmpwoobJauoltUdBxzOHlrnm6ndEsPs
 3LQLZZkj+Gl7bbIb2NBIm8JaHj0U+hGgLL6R+4rFKAGKE1+im7dUzpFYS66VoHYeXpCH
 yN631pQLCQBDwH41qen0zw+yaPzoqj+fIOhKNZDtz8ahvx/Aq0j8vF0mfh21OLBdEGic
 TtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YbthgLQX6PVxEgsoPOJaLAIyrZtTBCWitjyXiVAZKFc=;
 b=chg0Z5VtUXpvood8UJZ3nxku3qSb0sQKxh2MWfRI7kTg6cYoDy8SbAFfY4t1RLM+Up
 +aKLRPS6wG2GLPj98pWQ7uxkExbqL0eEPQEIAdDwDP8CKCradu+r4cT4CbF99Kr74MgP
 amGxjsloBvvDBqepsR1wvBuiZjl1JMttqp9r8tZrx57BkshatinMxZI8vVoh7Ei0GSaC
 2f6pe5FCuA3Y8Xg6E3NWDQnquGs7IeFi9+xX4BaVUE39BJhpR83qK9mUjXfDXmmMnO6p
 Jarggd6I+A0AiZBIHD17IfxEfLHdD2PdBbD5XUFp2heW1NqD+DFp8kvHopy1JBodChPA
 huHA==
X-Gm-Message-State: AOAM532ZqFpM4C7hD0VkrSwW66xVOdq9xRbRKuMTgNBnQV47FAzcPQb8
 Fst63N/bN79JLpS/7smrfRNn
X-Google-Smtp-Source: ABdhPJyvP26vjZiloPCLxyUIb6Ev4a6e/3IDHi+VOhE/JIpUVFAK5ky/dcPUR43/qRzrOTKfGn+rSw==
X-Received: by 2002:a2e:557:: with SMTP id 84mr3169798ljf.211.1626341885050;
 Thu, 15 Jul 2021 02:38:05 -0700 (PDT)
Received: from [192.168.1.53] ([91.247.148.7])
 by smtp.gmail.com with ESMTPSA id m16sm391522lfl.300.2021.07.15.02.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 02:38:04 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20210714140716.1568-1-pvorel@suse.cz>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <77583f09-e378-c39e-8ca2-6bf77adbda52@bell-sw.com>
Date: Thu, 15 Jul 2021 12:38:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210714140716.1568-1-pvorel@suse.cz>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 LOTS_OF_MONEY,MONEY_NOHTML,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/2] Add TST_NET_IPV{4,
 6}_ONLY and use on broken_ip
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

On 14.07.2021 17:07, Petr Vorel wrote:
> Hi Alexey,
> 
> https://github.com/linux-test-project/ltp/issues/843
> 
> does it make sense to run it on IPv4 and broken_ip-totlen on IPv6?
> Both don't break but not in runtest file.

Hi Petr,

Yes it should work with the -L option, but these tests are the same
(differs the descriptions for IPv4/IPv6):

diff -u broken_ip-plen broken_ip-totlen
--- broken_ip-plen	2020-10-08 22:23:52.000000000 +0300
+++ broken_ip-totlen	2020-10-08 22:23:52.000000000 +0300
@@ -10,7 +10,7 @@

 do_test()
 {
-	tst_res TINFO "Sending ICMPv$TST_IPVER with wrong payload len for $NS_DURATION sec"
+	tst_res TINFO "Sending ICMPv$TST_IPVER with wrong total len field for $NS_DURATION sec"
 	tst_icmp -t $NS_DURATION -s "0 100 500 1000 $NS_ICMP_SENDER_DATA_MAXSIZE" -L
 	tst_ping
 }

So broken_ip-totlen should be just removed.

> 
> Kind regards,
> Petr
> 
> Petr Vorel (2):
>   tst_net.sh: Add variable for supported protocol
>   broken_ip: TCONF when test run on unsupported protocol
> 
>  testcases/lib/tst_net.sh                              | 8 ++++++++
>  testcases/lib/tst_test.sh                             | 2 +-
>  testcases/network/stress/broken_ip/broken_ip-checksum | 3 ++-
>  testcases/network/stress/broken_ip/broken_ip-fragment | 3 ++-
>  testcases/network/stress/broken_ip/broken_ip-ihl      | 3 ++-
>  testcases/network/stress/broken_ip/broken_ip-nexthdr  | 3 ++-
>  testcases/network/stress/broken_ip/broken_ip-protcol  | 3 ++-
>  7 files changed, 19 insertions(+), 6 deletions(-)
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
