Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 209303F84A2
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 11:36:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3786E3C93B4
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 11:36:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AA04E3C2E39
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 11:36:10 +0200 (CEST)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6B0341A01156
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 11:36:09 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id j12so3920672ljg.10
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 02:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9bCUL0agkRy/bB3orq97M3WQx0a1vMwks4ms2hRz3lM=;
 b=ynY8aoFJPH5ppraNjikYdytAOJEgbMiP90uZyOTXOvf6FlJ25xHeXOQSP1N5vAGYlK
 HmYUP+pDX8g4NojxgTSPXEq6bNrV9e8CYUdRRxwaqI4m1VA1LNHwFwBa8GU31G628ZCr
 f3rgwYvfd+qRmL7Nzn53xpABrqHWIgDe/xFcprE/i0LuE34EEahGwG/m6K3L+yYkQ1lQ
 HPZtCgcOi+Gbazg8o39M+b+T6XotXqBYtcotXy246dWGBz/NwvtxSrxLtDGjRHR1PyNM
 DEfSibkY0vbOTAcIz6faY/Cl0BV4wVugj9NDV0zcfluvc/yP9vUVFFI+KRocY5uW3mYK
 aOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9bCUL0agkRy/bB3orq97M3WQx0a1vMwks4ms2hRz3lM=;
 b=TngvIdGUVkmw2SP2roQ0rsYgpZ0zhGEqckjvwr4QbhSZmWU9eMxQ3dKyK8cE0qQB19
 1QhqyQni2L5tksx2H5ztokpH8rcsy2l5rvjoyYPGrYUlnd/FMihk4UG3LDKGEW6DtWAn
 bx8xBn9YVRwR5h8rxaF5h4jytnS0naW3LTxwaU+obmmyprCgnzqsmVe5fym6yxfzpnI2
 Ed2M4polwmNhUrbEMm9ljHDmd8MvN168Wx+MMWykxmYAMUDA88S1+rNfh17Y0ItRkWG3
 3/4nXEn7NRtLi1NclW4+PLp11KNo1JlbaIXFmEy3qt5pHVxntot6lYIgEjcSLceDh9w+
 vukw==
X-Gm-Message-State: AOAM532M7cXo69VHESH9FMnxGZvzgDMe8AIT5IPIJpdiqJjHmXBhG1vn
 rSHFYunSpEjX9ACEdjin0xz69EcdREwp
X-Google-Smtp-Source: ABdhPJzRh54uAe1HTrZYQ7d2ezVbpQrNT4qlwKztTWbwf7j1iwGSTlrFw2L27nR1uhbjF+9VuzEmYQ==
X-Received: by 2002:a2e:a234:: with SMTP id i20mr2273367ljm.38.1629970568425; 
 Thu, 26 Aug 2021 02:36:08 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id a27sm264517lfm.305.2021.08.26.02.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 02:36:08 -0700 (PDT)
To: "suy.fnst@fujitsu.com" <suy.fnst@fujitsu.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
References: <TY2PR01MB212429263FC238F44A2C1D7D89C79@TY2PR01MB2124.jpnprd01.prod.outlook.com>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <410b2b2d-9633-7a57-527a-1663afe5f631@bell-sw.com>
Date: Thu, 26 Aug 2021 12:36:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <TY2PR01MB212429263FC238F44A2C1D7D89C79@TY2PR01MB2124.jpnprd01.prod.outlook.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 26.08.2021 08:26, suy.fnst@fujitsu.com wrote:
> While running mpls02.sh -6 in our slow test box with kernel
> version > v5.11, we found the test hangs at ping6 occasionally:
> 
>   + grep -q 'invalid option'
>   + for size in ${msg_sizes:-"56"}
>   + EXPECT_PASS ping6 -I fd00:23::2 -c 500 -s 10 -f fd00:23::1
>   '>/dev/null'
>   + _tst_expect_pass tst_res ping6 -I fd00:23::2 -c 500 -s 10 -f
>   fd00:23::1 '>/dev/null'
>   + local fnc=tst_res
>   + shift
>   + tst_rod ping6 -I fd00:23::2 -c 500 -s 10 -f fd00:23::1 '>/dev/null'
> 
> The weird part is that manual ping6 works in the meantime.
> 
> Then we found that adding `sleep 1` at end of mpls02.sh/setup() make
> the test pass in 100%. Dig depper in the problem, ftrace catched during
> the 1 second shows (The test started at [ 3979.485488]):
> 
>  3981.210701 |   2) kworker-24742  |               |  addrconf_dad_work() {
>  3981.210712 |   2) kworker-24742  |               |    addrconf_dad_completed() {
>  3981.210712 |   2) kworker-24742  |   0.417 us    |      addrconf_del_dad_work();
>  3981.210713 |   2) kworker-24742  |               |      __ipv6_ifa_notify() {
>  3981.210716 |   2) kworker-24742  |   1.097 us    |        inet6_fill_ifaddr();
>  3981.210730 |   2) kworker-24742  |               |        ip6_ins_rt() {
>  3981.210731 |   2) kworker-24742  |               |          fib6_add() {
> 
> In kernel, addrconf_dad_work() is delegated by inet6_addr_add() to do
> route related jobs in a delayed workqueue . Hence, there is tiny period
> we need to wait for it. Adding the `sleep 1` seems suffcient for now.

What is happening in the ping6, it is OK for it to hang on this?

Adding nodad to loopback might only change the flags (remove tentative
if ifa_flags==IFA_F_NODAD), the delayed dad work should be completed in
addrconf_dad_begin() for it anyway... but will it make any difference
for ping6 to change the test as below?

ip addr add $ip_loc/$mask dev lo nodad
tst_rhost_run -s -c "ip addr add $ip_rmt/$mask dev lo nodad"

> Signed-off-by: Su Yue <suy.fnst@fujitsu.com>
> ---
>  testcases/network/mpls/mpls02.sh | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/testcases/network/mpls/mpls02.sh b/testcases/network/mpls/mpls02.sh
> index 2fd3ec5bf4ba..75f5fca32f9a 100755
> --- a/testcases/network/mpls/mpls02.sh
> +++ b/testcases/network/mpls/mpls02.sh
> @@ -35,6 +35,8 @@ setup()
>  	tst_rhost_run -s -c "ip addr add $ip_rmt/$mask dev lo"
>  	tst_rhost_run -s -c "ip route add $ip_loc/$mask encap mpls 60 via inet$TST_IPV6 $(tst_ipaddr)"
>  	tst_rhost_run -s -c "ip -f mpls route add 50 dev lo"
> +
> +	sleep 1
>  }
>  
>  do_test()
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
