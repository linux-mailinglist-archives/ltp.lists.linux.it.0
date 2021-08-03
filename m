Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D76E3DEAF5
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 12:31:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC5F03C8888
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 12:31:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E22363C1882
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 12:31:24 +0200 (CEST)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1BF351400F22
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 12:31:24 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id c16so9402454lfc.2
 for <ltp@lists.linux.it>; Tue, 03 Aug 2021 03:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3bTAEpY9Gn5TksfjOzdeJ7BwdyFs7P1AQr3lBhWIB28=;
 b=TQddm5yS0nFg78FTLOfd9XqUXmkFOdNNm0ORl/ZGo9FcorYw+wBtioEd0nLgprc+30
 DN71G9bEShj1cb3fCSP4Un/QGzCd3/5tRcMUjeCd6S7eaVisTBhfziGZckz5Olm/plMd
 w5nl1rHFwwyJp/+Pd+VetFS2FQwM+Whm9Gda37KkIt9mncSFupcgZ7ud4M0kVmEoQKUW
 o8F/6a9Ye1nRLIv7HDYtOITvq3O72OR0+nMpReWbhc408Nz3ZHPROMsmAvmIWZi+fZwS
 B3MQg69k8VU706AcIb2tsmVgnrctRcDWXzCFqxKv4VHnJZq/Ntgg+J05G0mt8l75l2b6
 aBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3bTAEpY9Gn5TksfjOzdeJ7BwdyFs7P1AQr3lBhWIB28=;
 b=YgI1P2ThHVbiR/eAqbXhi4i6NcrG30X9JKk0AdoLigMo+BvqYjEDtJjjP3qzFrNVvS
 JjPqqMs9BCok0Nlkdj85fPVcPuJ/6veLrXuKgK9bjIybMr9fFwvCj+RSX13AjkVPf42G
 rqH6XoJ2ByTvTLWP0wqduC21PEY/TU6KnKQoZvtqVehsbYWFzdZ6/3nLLPkTvHv/KsvB
 v80+IsxI9l0t/OqwDJL1eTObRzGqZkctj+CKed0/2JK/BDW9lSwVvOFf5t6YYQT5byLI
 2fELQWttYrNfVQIaxe+OPUubgfIkSRXZ6bM8JuNhxGu8OUR9BXFJNxngGr8iUYx2yJUC
 c0gg==
X-Gm-Message-State: AOAM532WzfB29n+iGkoTccVr7xzcfvoKXCcrovA9cpUuE8NiqbzLNnT5
 znss4o+yakaFHkmVvknM+Hl2
X-Google-Smtp-Source: ABdhPJzR7H4VEb9KHnnQArBSguab1NubjxpNpwKTOmCtYefEjiiYel8/Bb5ABd1/kpTSmeNpaUHzFw==
X-Received: by 2002:ac2:5f72:: with SMTP id c18mr3809419lfc.390.1627986683510; 
 Tue, 03 Aug 2021 03:31:23 -0700 (PDT)
Received: from [192.168.1.53] ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id f23sm1215432lfc.225.2021.08.03.03.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 03:31:23 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>
References: <20210714140716.1568-1-pvorel@suse.cz>
 <20210714140716.1568-3-pvorel@suse.cz>
 <57d4c109-d01a-2c7f-39c7-41013e70abf9@bell-sw.com> <YQBD4w2nKwY2G1l+@pevik>
 <b0638d98-88d5-76d7-78a1-631c801d88ad@bell-sw.com> <YQg0LIXG8LK0OV74@pevik>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <80a6cbec-50b7-9912-d682-915a1076bbec@bell-sw.com>
Date: Tue, 3 Aug 2021 13:31:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YQg0LIXG8LK0OV74@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] broken_ip: TCONF when test run on unsupported
 protocol
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

Hi Petr,
On 02.08.2021 21:06, Petr Vorel wrote:
> Hi Alexey,
> 
>> Hi Petr,
>> On 27.07.2021 20:35, Petr Vorel wrote:
>>> Hi Alexey,
> 
>>>> On 14.07.2021 17:07, Petr Vorel wrote:
>>>>> net_stress.broken_ip runtest file is correct, but some users try to run
>>>>> tests manually.
> 
>>>>> Fixes: #843
> 
>> ...
>>>>>  do_test()
> 
>>>> The generic version looks fine:
> 
>>>> Reviewed-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
> 
>>> I didn't understand whether you'd prefer to add TST_IPV6=6 (or TST_IPV6=) where
>>> needed or accept this patchset. Both would work.
> 
>> I think for manual runs it is better to set TST_IPV6=6 in the test
>> so it will run the test rather the require passing some options.
> It looks like specifying TST_IPV6=6 is not enough, because tests are using
> $NS_ICMP_SENDER_DATA_MAXSIZE which is defined in tst_net.sh according to
> TST_IPV6. We can
> 
> 1) overwrite NS_ICMP_SENDER_DATA_MAXSIZE="$NS_ICMPV6_SENDER_DATA_MAXSIZE"
> 2) check TST_IPV6 before running tst_net_parse_args and if set overwrite -6 flag
> 
> But both are quite ugly, thus unless you have better idea I merge this patchset.


Are you sure that you are getting the wrong maxsize? if TST_IPV6=6
is set before the setup, in the test, why tst_net_setup() is setting
the IPv4 value?

> 
> Kind regards,
> Petr
> 
>>> Kind regards,
>>> Petr
> 
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
