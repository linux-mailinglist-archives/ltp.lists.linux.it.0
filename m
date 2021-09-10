Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F12406A6E
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Sep 2021 12:56:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A53643C8EA6
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Sep 2021 12:56:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9F0403C2170
 for <ltp@lists.linux.it>; Fri, 10 Sep 2021 12:56:27 +0200 (CEST)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 03FBF601416
 for <ltp@lists.linux.it>; Fri, 10 Sep 2021 12:56:26 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id t6so444894edi.9
 for <ltp@lists.linux.it>; Fri, 10 Sep 2021 03:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sMJH6HRBldw9J39XGvleIIiTsJkcwRtm+inOZIjbMRg=;
 b=LwWlGloVWyIWihJhgr0dDuI+q4pvKbtq751wpd9XiHFPQ9JFqTtJHSxLgaEWqippmD
 OxCKWfi+1fSApIJrcNeWKVApfyOBFeUDhclk1BDF9IO7zCOfVsxMdZsy6VGM0UfdlfZI
 kIjUC5o0MX5zf0pZQxsc1UN+gy0RmtZvkTeHpIPD8sU2uCIMVDBeC3JYtODeNEJMl/5/
 wte1Sc4ZE/GGzO5qQmr5gKnbFbs0K2lTB8XWILr8wLGafFoacVBI4TJqPvUTVTmvbNTC
 QvwniQLW3Q/7peNiFPIFi16FaPODHrGV7kNLuQoqZlKMK4YW4/RPSgrTqNapq8gflH+/
 OmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sMJH6HRBldw9J39XGvleIIiTsJkcwRtm+inOZIjbMRg=;
 b=DOUaT3ce02jrxsjsqeVHhLyXCAPH6de8F50L5qtd+pe69jEEkFtYavpulJMzDnSqS2
 3cNZBTlO+sf3meZZtKxyqZ3IfQrxqTP4kiOCNxry264GDzfkr/aHEg5Lo6O2CxA77+aL
 4qpzNXkU1LaWHumqJZyobp0yywGy2+FzpVHpL/g4LV8lg2zRrdEMKQNYpF4Zmosg8Pre
 ZI0vSXtpOjqdZjlQo7ae5dlUQxf3auuy/76vlrpG/Ic0Zn1DR2lq0EXh1Da9+SGJsLIT
 hnbXGASdEMXVsfA/I+c9Lvpi15IAwKjOzOrM+JxQkqN+3dUmgmJlEnIqrsW202EXG1Bk
 Y/Kg==
X-Gm-Message-State: AOAM530T/iWQNIUUhYbrRHP24Uy+eEQVwgRqW7QW8FVb3L868YfK78k9
 H5QnrzhQBNSgh+3RnecL5M3jMkJLy+cuZWM4cwz0Ew==
X-Google-Smtp-Source: ABdhPJxJ70BXqmVXIFsBOEda98dM8PTqgygnW0hKyGxazpmTkOzpzOkSyKRsbhbHdgEUjECI2Os8Sjq8/hBLciNLgFA=
X-Received: by 2002:aa7:dcd0:: with SMTP id w16mr6104447edu.288.1631271386343; 
 Fri, 10 Sep 2021 03:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210906083444.82394-1-naresh.kamboju@linaro.org>
 <YTngKohBcpQK7l5r@pevik>
In-Reply-To: <YTngKohBcpQK7l5r@pevik>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 10 Sep 2021 16:26:14 +0530
Message-ID: <CA+G9fYsiHOBCDb8gub7FVfETydGy0JwDNUDkazTqPo=qhhcvwA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] runtest/smoketest: Remove intermittent failed
 test case route4-change-dst
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On Thu, 9 Sept 2021 at 15:51, Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Naresh,
>
> > The test case route4-change-dst fails intermittently creating
> > the problem for smoketest results verdict. route4-change-dst
> > is a stress test should not be a part of smoketest. because of
> > these issues removing route4-change-dst from the smoketest.
> Could you please be more specific about the failure?

Test log,

route-change-dst 1 TINFO: initialize 'lhost' 'ltp_ns_veth2' interface
route-change-dst 1 TINFO: add local addr 10.0.0.2/24
route-change-dst 1 TINFO: add local addr fd00:1:1:1::2/64
route-change-dst 1 TINFO: initialize 'rhost' 'ltp_ns_veth1' interface
[   54.413187] IPv6: ADDRCONF(NETDEV_CHANGE): ltp_ns_veth2: link becomes ready
route-change-dst 1 TINFO: add remote addr 10.0.0.1/24
route-change-dst 1 TINFO: add remote addr fd00:1:1:1::1/64
route-change-dst 1 TINFO: Network config (local -- remote):
route-change-dst 1 TINFO: ltp_ns_veth2 -- ltp_ns_veth1
route-change-dst 1 TINFO: 10.0.0.2/24 -- 10.0.0.1/24
route-change-dst 1 TINFO: fd00:1:1:1::2/64 -- fd00:1:1:1::1/64
route-change-dst 1 TINFO: timeout per run is 0h 15m 0s
route-change-dst 1 TINFO: change IPv4 route destination 100 times
route-change-dst 1 TINFO: testing route '10.23.1.0/24'
bind: Cannot assign requested address
route-change-dst 1 TFAIL: ping -c1 -I 10.0.0.2 10.23.1.1 >/dev/null
failed unexpectedly
route-change-dst 1 TINFO: initialize 'lhost' 'ltp_ns_veth2' interface
route-change-dst 1 TINFO: add local addr 10.0.0.2/24
route-change-dst 1 TINFO: add local addr fd00:1:1:1::2/64
route-change-dst 1 TINFO: initialize 'rhost' 'ltp_ns_veth1' interface
route-change-dst 1 TINFO: add remote addr 10.0.0.1/24
route-change-dst 1 TINFO: add remote addr fd00:1:1:1::1/64

Summary:
passed   0
failed   1


>
> I'm not against adding ping tests into smoketest runtest file,
> although just on might be enough. ping02.sh is the fastest from all 3 tests,
> maybe add it. Also -6 for IPv6 would be good (to detect problems with IPv6 setup).

I will add
ping602 ping02.sh -6

>
> But route-change-dst.sh is quick (actually 2 times faster than ping01) that it's
> not really a stress test in the default configuration, thus I'd prefer to keep it.

The actual problem with route-change-dst.sh is an intermittent failure
test case.

Here is the link showing intermittent failure.  (click on the loadmore button)
https://qa-reports.linaro.org/_/comparetest/?project=136&suite=ltp-smoketest-tests&test=route4-change-dst


- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
