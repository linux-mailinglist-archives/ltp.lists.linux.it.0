Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F3B3B6666
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 18:06:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC1AF3C6E93
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 18:06:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 55D593C1AD6
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 18:06:00 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5737C60091A
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 18:05:59 +0200 (CEST)
Received: from mail-ed1-f71.google.com ([209.85.208.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lxtlm-0002aq-H4
 for ltp@lists.linux.it; Mon, 28 Jun 2021 16:05:58 +0000
Received: by mail-ed1-f71.google.com with SMTP id
 ee28-20020a056402291cb0290394a9a0bfaeso9802645edb.6
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 09:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6MMFuevShapokRflbU3rWsv/OVSfs5ZVVuUd69KjeUQ=;
 b=Xwg06uHMp0LoEuR/piHbLGDDgkWx+muqlCbOMxl7umDBo+GiE0iCdS9xLv0jVFvomQ
 1mynNrQ9qvGB9kP3yEVCzh0CkRISY5SIBtbzmwoOncrKEJnKenNP2ifwhIS6i9i0u4IB
 UdkLxeUMxkVlMB8CbPSWqp0Lho2RfLZLdR583I6Y3IEYJaGKwzwyNtpPfcA3apL3KYBX
 N34zMRDHdIO2GnltTIddAdhbm038c4JmjokfZKvSbOwJZapqGmFyG+m6HVi1NSECpawR
 w9WqbQQ2P3iQnFOwleaj6ruXr8CBgh3/JO0YZKDoasPmgzNgYdnhm8qTc57NV4LC66eO
 DGkg==
X-Gm-Message-State: AOAM532Si0Y9jyngqRkIN44MOQXL/3mVzWWyF542REUVnKyCQ9MOmgs2
 0k+w1UHtul56I1kyGOMGbw5AI8gc8OL8R8a3NC8obOZnt9QlUWdHdRy+5fHo5QyotIJ8Xm5f9Xx
 GTAggJuOe6nZgBW4WUQ8xY1IFHNBX
X-Received: by 2002:a17:907:1b1b:: with SMTP id
 mp27mr24547395ejc.538.1624896357579; 
 Mon, 28 Jun 2021 09:05:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaObsuz6GT5oWx8cx4RZpNaGI+AzPCg/Ajvn+xUjwnCXq2X+rDPyWal/olnL8ZDw91vfoTDQ==
X-Received: by 2002:a17:907:1b1b:: with SMTP id
 mp27mr24547380ejc.538.1624896357390; 
 Mon, 28 Jun 2021 09:05:57 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id bz27sm7147071ejc.15.2021.06.28.09.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 09:05:57 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>
References: <20210623135912.81156-1-krzysztof.kozlowski@canonical.com>
 <20210623135912.81156-3-krzysztof.kozlowski@canonical.com>
 <YNnhBhN6bzUCfqdk@pevik>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <07365741-d607-b1b0-879a-ecf7ae34cc14@canonical.com>
Date: Mon, 28 Jun 2021 18:05:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNnhBhN6bzUCfqdk@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/4] syscalls/msgstress04: fix fork failure on
 small memory systems
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

On 28/06/2021 16:47, Petr Vorel wrote:
> Hi Krzysztof,
> 
> nit: Instead of git commit subject "syscalls/msgstress04: fix fork failure
> on small memory systems". I'd use "tst_pid.c: fix fork ...".

Sure.

>> +/*
>> + * Get the effective session UID - either one invoking current test via sudo
>> + * or the real UID.
>> + */
>> +static int get_session_uid(void)
>> +{
>> +	const char *sudo_uid;
>> +
>> +	sudo_uid = getenv("SUDO_UID");
>> +	if (sudo_uid) {
>> +		int real_uid;
>> +
>> +		TEST(sscanf(sudo_uid, "%u", &real_uid));
> FYI We recently decided to not use TEST() macro in library itself.
> See Richard's effort [1]. We should document it in LTP Library API Writing Guidelines [2]
> 

I'll remove it.

>> +		if (TEST_RETURN != 1) {
>> +#ifdef DEBUG
> FYI we don't support DEBUG. Either the information is always important or not.
> In this case I'd probably avoid printing it.

Sure.

> 
>> +			tst_resm(TINFO, "No SUDO_UID from env");
>> +#endif
>> +		} else {
>> +			return real_uid;
>> +		}
>> +	}
>> +
>> +	return getuid();
>> +}
>> +
>> +static int read_session_pids_limit(const char *path_fmt, int uid,
>> +				   void (*cleanup_fn) (void))
>> +{
>> +	int max_pids, ret;
>> +	char path[PATH_MAX];
>> +
>> +	ret = snprintf(path, sizeof(path), path_fmt, uid);
>> +	if (ret < 0 || (size_t)ret >= sizeof(path))
>> +		return -1;
>> +
>> +	if (access(path, R_OK) != 0) {
>> +		tst_resm(TINFO, "Cannot read session user limits from '%s'", path);
>> +		return -1;
>> +	}
>> +
>> +	SAFE_FILE_SCANF(cleanup_fn, path, "%d", &max_pids);
>> +	tst_resm(TINFO, "Found limit of processes %d (from %s)", max_pids, path);
>> +
>> +	return max_pids;
>> +}
>> +
>> +static int get_session_pids_limit(void (*cleanup_fn) (void))
>> +{
>> +	int max_pids, uid;
>> +
>> +	uid = get_session_uid();
>> +	if (TEST_RETURN != 1) {
> and here as well 

OK, thanks for review!


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
