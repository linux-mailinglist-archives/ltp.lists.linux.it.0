Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC27396F71
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 10:48:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F0BE13C8019
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 10:48:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9B8F63C5599
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 10:48:46 +0200 (CEST)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2BE536008C3
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 10:48:46 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id q1so20593359lfo.3
 for <ltp@lists.linux.it>; Tue, 01 Jun 2021 01:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=3EkZu/ZiQhOrQ+XYa+x1fyL/rkKyPwn4E8SE63HcTEo=;
 b=ZM1rzNKoHes3dp3d/ql2BbJqzTT3hfJTKBT/Yc5mtU5mMjtSovIvkOf4WksYwqSYyK
 0D3o7qznSmeBljLwfW+9enSeypNSpCeMJl9eCBl4+Kpaa3nHyTk985Wq8BiNvddzwNDX
 EkEKW6+2tpmdaEqGNkGiQpcsRQlaJsPfZbki0I0haqAd0CUxvO0wlsATNOUciJjMn5GP
 AakShaKTxDnlGBTXnxfXVrlIimKm4ExQ2xFCzjRSjsSpixkcsQg8a8Km7DsgmQhIC+hv
 ahRmIfe4qm5rTNnj+IV2KYF2sLIvd4NM9eyK2jCIQ99wCnhRRjMcokW20kDL1HKtiyIm
 H9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3EkZu/ZiQhOrQ+XYa+x1fyL/rkKyPwn4E8SE63HcTEo=;
 b=mqpl0a9P/jIceIcIjpDFBLz1/UCSsb9bzW5L2gvExYHGBJ/Lh6sY/ezK0lW52mwwEJ
 pvSTtvWF4Z281wX9R1XLHlj6sjIqibrjbkcBJs5Xn0x7Y+GcS1dx0BN2qi1ECztMgPg6
 xZKEtN8djxHjgEn07pD7HeFDiouMTk2MY5qyFC80syvKPwHohW/wvVlouXOLGgE9Pdur
 hwA5ato4KjiN9k0mHK+s+DWK9Q+/X+DKypJ+3/skJy7m+DQnykouy10vJVEIQq3sYM/F
 yShG3JVETb/ni703of77Au/wcnH6eB54V5+ye2NKGp1uIzMUJzQk1Htcmex8UmgNoTsm
 htCg==
X-Gm-Message-State: AOAM530MWpGshQbLM9c5S4jOwnPeWwDkfilK+PouiRefAmBP/kifVQ7x
 VWD1ItqQQpmij0TATu6xLaa1M7G7Uvr+fX0=
X-Google-Smtp-Source: ABdhPJzXltzL5U13c9acVZQWbVeKzgz0n/hSrHZxHPPjMzdOQb5CthTbOUmkjtQk6+UKoKaQpgpIKQ==
X-Received: by 2002:a19:f703:: with SMTP id z3mr8019418lfe.61.1622537325340;
 Tue, 01 Jun 2021 01:48:45 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id a2sm1619884lfu.128.2021.06.01.01.48.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 01:48:45 -0700 (PDT)
To: Martin Doucha <mdoucha@suse.cz>, ltp@lists.linux.it
References: <20210531135314.5067-1-mdoucha@suse.cz>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <f8300887-b372-950e-5c26-92ba36869246@bell-sw.com>
Date: Tue, 1 Jun 2021 11:48:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210531135314.5067-1-mdoucha@suse.cz>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.5 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] network/busy_poll: Fix tests in namespaced env
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

On 31.05.2021 16:53, Martin Doucha wrote:
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>  testcases/network/busy_poll/busy_poll01.sh | 15 ++++++---------
>  testcases/network/busy_poll/busy_poll02.sh |  7 +++----
>  testcases/network/busy_poll/busy_poll03.sh |  7 +++----
>  3 files changed, 12 insertions(+), 17 deletions(-)
> 
> diff --git a/testcases/network/busy_poll/busy_poll01.sh b/testcases/network/busy_poll/busy_poll01.sh
> 

Hi Martin,

...
>  setup()
>  {
>  	busy_poll_check_config
>  
> -	busy_poll_old="$(cat /proc/sys/net/core/busy_poll)"
> -	rbusy_poll_old=$(tst_rhost_run -c 'cat /proc/sys/net/core/busy_poll')
> +	busy_poll_old="$(sysctl -n /proc/sys/net/core/busy_poll)"
> +	rbusy_poll_old=$(tst_rhost_run -c 'sysctl -ne /proc/sys/net/core/busy_poll')
>  }

Here should be net.core.busy_poll, not the path.
Otherwise looks good.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
