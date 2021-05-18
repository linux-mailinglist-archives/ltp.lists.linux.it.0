Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2050E3874F9
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 11:22:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E59E23C87D7
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 11:22:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A49443C0BCB
 for <ltp@lists.linux.it>; Tue, 18 May 2021 11:22:33 +0200 (CEST)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 22E231400DD3
 for <ltp@lists.linux.it>; Tue, 18 May 2021 11:22:33 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id o8so10769717ljp.0
 for <ltp@lists.linux.it>; Tue, 18 May 2021 02:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=73yoBAEVtDrZq86LiECD1gxwFEQzCZNKsHM/qNAiFBw=;
 b=j0FtB07/jbfnawO97rWcxXu8quSfRiZOH3htxvpPYbNTiy96xazOyFlSJrlBWC+j+m
 WcYliZdNFzdd1ytkFmKL7TjCQMfGeogiZJ+e9rlJysnq2uXYU1OorUi2S9A4Y0gEPMxu
 eu7F0WTUhpqmD6esoCuUBApYKQqlQLmGQAloevBGCog0/SukLhls4qorPpxpyT+Mdp9i
 wmGMerTxdz6h76ZX3q2mkMiKr8dh8RPXiIIiS10p6J/S+8EdTBjrl3U8UByBEw9MRMfG
 aZy10RDoCffvsaj0aE754IfVKA2L3t0Q2M7UGsxU4J6mtX96N2Bn62OJwQUCcKbrg5iS
 IX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=73yoBAEVtDrZq86LiECD1gxwFEQzCZNKsHM/qNAiFBw=;
 b=J+juXIIW22ig0u96hB/LJ9mZ1sbW8f/hVvfDFAYf82iYfJ/Bwxan/mr9OcJwQxj0i7
 YBPQFMx1m8Edm6wwzLFMg/YFKXavy53SJ1IXk/ft2OrUVtj9LYOOjBeOO72ctn8bJoMp
 SQI7TOGlgyUvS19Cj+k97NVS0OIPjxOnrDr13a6YSA2WHkjfc7zwWcCN87V70UAZlnEe
 uVyJ+wy1ZIpZ8FN8Py6olpR6nP9yRDNMRLZNqCtUIMu+UU2WWO8OJVExMoT6h2dI6VtJ
 sY4sMCPgjRF25SW1XiZ3GxQbNanWrGEInq/RYaHXaEmD+xnHK4bVgys5Kr8Lb4K9ClqF
 Edhg==
X-Gm-Message-State: AOAM530OQUQAlW7NLb3SXu+kGwvaKzvqW0P4XIWoLhq2H0Xh9J6TOjGb
 WnwmaEtHb1rSC1XmH2w147lN
X-Google-Smtp-Source: ABdhPJyi3vOE7ujYYB6GcK4AsL9K8wlcOeMVFFddPyFCA7mwX4SaMTKNJxKqhVV3W3MYQ1/tZ10cSg==
X-Received: by 2002:a2e:bf14:: with SMTP id c20mr3325122ljr.57.1621329752473; 
 Tue, 18 May 2021 02:22:32 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id 8sm580355lfy.284.2021.05.18.02.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:22:32 -0700 (PDT)
To: ltp@lists.linux.it
References: <20210518091422.41857-1-aleksei.kodanev@bell-sw.com>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <f584f853-c13c-cc16-8e75-085af0b82418@bell-sw.com>
Date: Tue, 18 May 2021 12:22:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518091422.41857-1-aleksei.kodanev@bell-sw.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] network/lib6/getaddrinfo01: rewrite with the
 new API + use static hostnames
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

On 18.05.2021 12:14, Alexey Kodanev wrote:
> The test is now independent of various machine settings
> regarding the test host name as it adds predefined names
> and aliases to /etc/hosts file and restores it to its
> original state after completing the test.
> 
> This should fix the following failures:
> * when gethostname() returns an alias name that doesn't
>   match canonical name;
> * No AAAA record for the returned name from gethostname().
> 
> Addresses and names added to /etc/hosts are more or less
> unique, so that there are no conflicts with the existing
> configuration.
> 
> Also most of the duplicate code is now gone.
> 
> Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> ---

Adding missing v2 update suggested by Petr:
* description tag
* new check_addrinfo_badflags(const char *) to remove even more code
duplication.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
