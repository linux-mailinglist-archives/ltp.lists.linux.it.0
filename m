Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7FD4089F0
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 13:14:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 568643C8A73
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 13:14:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1EE0E3C8A1E
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 13:14:35 +0200 (CEST)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3B8B014001E7
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 13:14:35 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id h16so20283908lfk.10
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 04:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZhiIuLhwIwmz9qIrVJGha1fGZ9WnoX6jKwGFTGYvyeQ=;
 b=itqPS9DiJEBq277C7pB1x0+GJf8XA6EFy8flJc1vSU4PW9zrhV35cXvX7IzD3hi03H
 EWE4A9z2FGQb+dKChUAnIB8twj6BTtiQaOCZTWRCHJloPY+4lXkitXhR/kr27W938X81
 1AGoQ5PvTQl/mtStTxUb/AQtV9G5BsF0BPrXeOeWc59yjQv8wQnDO2/H5XiyKAfU9MM/
 3sebIkSmnYLIya1mDEefd9LuL5K43OxcE24KHF/e3XM6YKSx0z2+LMWwdYSCsLKQB5eH
 VdWMB8xPInmYyfwydpqYtjxFgtzqzXt9Qw3WHOu95o+MjWKe3Bf1pC0QICyxNhaJO8Pp
 0FbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZhiIuLhwIwmz9qIrVJGha1fGZ9WnoX6jKwGFTGYvyeQ=;
 b=tdckrO7gsd/hVlGDaiYmLXR4GQBSpI6cvsC6Q9jyZnqCbSpcIvduhsc2nsdL5T2O9f
 dWtiIUSDgTm07LH0H4iBRlSkATmXUi9J8HmQNNfkpDPozh8rS+4MzU/kYw3rw8r9wa8U
 jaLg8HyykNvaIiTSVVffZgCgX9GxcREYOHmoL5FwJFYIq5aBHgm1+Cfa1O+fXNxpP/7j
 ABV9UYHS5xkwmRduhr7j+KQ05jInLPzGu/ao9KV14nzT+igLOeUMtcvjpOaiauQ+QAkL
 2d7S7PmFDSVjWyA2VLGesN/r+O8Jdffwb0YpeMIpsJMInMU9xdkZDpV18vEYt/TievLK
 uOrQ==
X-Gm-Message-State: AOAM531x+L7hHMKnZjhTXOCaFpy6ljcx/rovooMPCzlISYX6Fm3gHNnE
 TbDid87ln6QSg0V/CBM0+Wgqt8aaRtq3
X-Google-Smtp-Source: ABdhPJwOCOoMu2O47yL/t2RmIKlgHMaRUUTp/NCIkZjN6hH8jyizIuv/6bImeyE708TjMG4MOxg/bA==
X-Received: by 2002:a05:6512:234f:: with SMTP id
 p15mr8408608lfu.524.1631531672791; 
 Mon, 13 Sep 2021 04:14:32 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id p5sm796763lfu.272.2021.09.13.04.14.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 04:14:32 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>
References: <TY2PR01MB212429263FC238F44A2C1D7D89C79@TY2PR01MB2124.jpnprd01.prod.outlook.com>
 <410b2b2d-9633-7a57-527a-1663afe5f631@bell-sw.com>
 <TY2PR01MB21246C459BBCD763BD1C0CBD89CB9@TY2PR01MB2124.jpnprd01.prod.outlook.com>
 <0acf816462d49d8a6004c87e36b05d1b@suse.de>
 <8d93deac-eec1-5f87-57a5-c72b2f6e5973@bell-sw.com> <YTsnD0Uw4argiGOJ@pevik>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <61ea98da-6746-2ad3-c2de-38e148cc9d4c@bell-sw.com>
Date: Mon, 13 Sep 2021 14:14:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTsnD0Uw4argiGOJ@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/mpls: sleep 1 after setup in mpls02
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
Cc: pvorel <pvorel@suse.de>, suy.fnst@fujitsu.com, ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,
On 10.09.2021 12:36, Petr Vorel wrote:
>> On 09.09.2021 18:53, pvorel wrote:
>>> Hi Su, Alexey,
> =

>>> On 2021-08-30 11:26, suy.fnst@fujitsu.com wrote:
>>>> Hi,
>>>> =A0 I found that it's indeed related to ipv6 DAD as you said.
>>>> Calling
>>>> `ip netns exec ltp_ns sysctl -n net.ipv6.conf.ltp_ns_veth1.accept_dad=
=3D0`
>>>> or tst_wait_ipv6_dad() at end of the setup both solves the problem.
>>>> However there is one super strange part that the tentative address is
>>>> the local link adress of the ltp_ns_veth1:
> =

>>>> 5: ltp_ns_veth1@if4: <BROADCAST,UP,LOWER_UP> mtu 1500 qdisc noqueue
>>>> state UP group default qlen 1000
>>>> =A0=A0=A0 link/ether f2:8f:24:d4:ba:26 brd ff:ff:ff:ff:ff:ff link-netn=
sid 0
>>>> =A0=A0=A0 inet 10.0.0.1/24 scope global ltp_ns_veth1
>>>> =A0=A0=A0=A0=A0=A0 valid_lft forever preferred_lft forever
>>>> =A0=A0=A0 inet6 fd00:1:1:1::1/64 scope global nodad
>>>> =A0=A0=A0=A0=A0=A0 valid_lft forever preferred_lft forever
>>>> =A0=A0=A0 inet6 fe80::f08f:24ff:fed4:ba26/64 scope link tentative
>>>> <-------------------
>>>> =A0=A0=A0=A0=A0=A0 valid_lft forever preferred_lft forever
> =

>>>> However, there is no place using the address in mpls02 test.>> It make=
s me wonder how could it be possible to trigger the issue..
> =

>> Looks like the problem here in the neighbor discovery of fd00:1:1:1::2
>> using link-local address, and vice verse for the other side. mpls is
>> using the following route with the address:
> =

>> fd00:23::2  encap mpls  60 via fd00:1:1:1::2 dev ltp_ns_veth1 metric 102=
4 pref medium
>> so the address there should be in a reachable state...
> =

> Thanks for info! I wonder if it's a bug in mpls or elsewhere. WDYT?

https://github.com/iputils/iputils/issues/300

So we should be careful with the flood option in ping, especially
if it is the first test to run after initial test interfaces setup.
For example, for mpls02, it is "icmp tcp udp".

> =

>> Adding it manually in setup might fix the test as well:
> =

>> ROD ip neigh replace $(tst_ipaddr rhost) lladdr $(tst_hwaddr rhost) dev =
$(tst_iface) nud reachable
>> tst_rhost_run -s -c "ip neigh replace $(tst_ipaddr) lladdr $(tst_hwaddr)=
 dev $(tst_iface rhost) nud reachable"
> =

>>> I wonder if test still needs be fixed to work on all setups.
> =

> =

>> I think we could set accept_dad to 0 in generic setup of the
>> test interfaces, in tst_net.sh/tst_init_iface().
> Unless it's a bug we'd hide by setting it, I'd be for this general soluti=
on.
> =

> It'd be nice to get it fixed before release.

OK


-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
