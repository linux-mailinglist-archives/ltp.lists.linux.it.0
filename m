Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA523DB4AF
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 09:50:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 26CD33C6208
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 09:50:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 436033C1A29
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 09:50:21 +0200 (CEST)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 510DC200FEC
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 09:50:20 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id l4so11154517ljq.4
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 00:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N0Ahg6ukZ9XUMgciY+hNCrYzSABcgn632pe+O/eiqmg=;
 b=K+Y6VfZQyYAADaEePQma6rSKh2eii21CF2Ks1KNshclQqyAgAK77llxPcab4XVhCKf
 89Mhpfra6YWbcCdiDUpqLp1+hpNorkcKknaHIj+R9JiESchM1xd9rwEU54N2D2XPDj59
 xCCQHsX1Ox0orvYKcmqW+egZIIzxe0HmSX1PAPoy2tdOlrmBYtOc7F56dZfT4uvAr1/m
 6+7jJLJDfztChnApvvKJ4YH4W1go5204Dj+VrW4rp043MaShRrLV/tqkNXmT8e55XJUB
 tbtwnBk71Qg3LL07PxZ2Pfv+p8CIFtiS8tCPpCU1Eo9cmpdTlTdva1qYzwf3ROn/jZ/r
 suCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N0Ahg6ukZ9XUMgciY+hNCrYzSABcgn632pe+O/eiqmg=;
 b=q/dXd1vqs92CmASYHyzsuoZUT/tL9ZkgupxZN21NeQ6/yYYc4e5zFGfSVKx4SYmsMb
 5ZyFRCAdtcECCwtz5ZBSMBMQWSkdlOEFNT5Ex84Lx5GwtPAhKTw2yoqGrdSbvO2unia4
 Tgo42mv2kNg/I8zEiq+vf5N5Q4YoiiHxCkgr181dnuX8cxTX26g0YW+JVVs9usuq68Yk
 BG/EorCFoz7i7cXPBICCo7VAfBcC1iAIOuD/5Hy6NhKIeY6H0O1kv6dBk1s6ROfev2aq
 rDicqxo9DxTpUCkgqBtg6P4XqyLJWifhcgFFu2+rtDWglfYSIkdJXzcOdQ4kLj0lMM5Q
 f03A==
X-Gm-Message-State: AOAM530NUoHtMtWJlSmOiRQ/XyvZzG/zbGulh3llFCpWktG/l6y0ntXt
 LttTvNhIJI6MZiiCjA0YrifdMpyHadBh
X-Google-Smtp-Source: ABdhPJy5B816PCKynMk5EDsGGFZ0ya8vTBDJ+aP0Z1Z4Zq/U4Q4TWU5SdmH+M/VXLXjT1FMIduHibw==
X-Received: by 2002:a2e:b16b:: with SMTP id a11mr839108ljm.346.1627631419576; 
 Fri, 30 Jul 2021 00:50:19 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id 8sm78669lfq.178.2021.07.30.00.50.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 00:50:19 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>, Radoslav Kolev <radoslav.kolev@suse.com>
References: <YQFWT/0MBcZsLNVV@pevik>
 <20210728140453.23356-1-radoslav.kolev@suse.com> <YQOlbyslKEiw9rCx@pevik>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <acd8f1e4-bdce-6cc1-b232-95f2a8a6e10b@bell-sw.com>
Date: Fri, 30 Jul 2021 10:50:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YQOlbyslKEiw9rCx@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] ipsec_lib.sh: check ip_vti/ip6_vti are enabled
 or skip tests
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

On 30.07.2021 10:08, Petr Vorel wrote:
> Hi Radoslav,
> 
> ...
>> +	if [ "$TST_IPV6" ]; then
>> +                tst_net_run -q "tst_check_drivers ip6_vti" || \
>> +                        tst_brk TCONF "ip6_vti driver not available on lhost or rhost"
>> +        else
>> +                tst_net_run -q "tst_check_drivers ip_vti" || \
>> +                        tst_brk TCONF "ip_vti driver not available on lhost or rhost"
>> +        fi
> nit: broken indentation, but that'll be fix during merge.
> 
> LGTM, but I'm going to merge shorter version (we have $TST_IPV6 for this
> purpose).
> 
> tst_net_run -q "tst_check_drivers ip${TST_IPV6}_vti" || \
> 	tst_brk TCONF "ip${TST_IPV6}_vti driver not available on lhost or rhost"
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>

Thanks Radoslav, Petr!

Reviewed-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
