Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLMqLGj5p2mtmwAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 10:20:40 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA051FD7D5
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 10:20:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772616040; h=message-id :
 to : in-reply-to : date : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : mime-version : content-type : content-transfer-encoding :
 sender : from; bh=RWBj789HCSiUrKB8R4V2KKfYWo3b/dWdN6e1tu5kcT0=;
 b=nIdoMWcEpIqzaLV9+I59JK7XoqyCywN89CWWZZIkmYzRick4NLOEhXV+VxuzbOlNzVE30
 Sne8PH0Sj3Ij46SWpgbFt5nkVQFO4ERVxD49kLsEH/9GD+137y33gcPFPZZp8ZLrCxkeq51
 TVa1zecyaITJExSnf/jkn4QyfpWUSYQ=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B0903DAC8A
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2026 10:20:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4263C3CB27C
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 10:20:37 +0100 (CET)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D433F1A002F5
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 10:20:32 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4833115090dso67599085e9.3
 for <ltp@lists.linux.it>; Wed, 04 Mar 2026 01:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1772616032; x=1773220832; darn=lists.linux.it;
 h=date:content-transfer-encoding:subject:in-reply-to:to:from
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=nIYZV4wIwN0c0BMAf0MMCsM9Xjm5KWqPcbqWD98uGZ0=;
 b=crDtNuvr/mGyGgUrjvz8LHWYsgosz0lTFAYrEVT8ElEaInTZhVslhXddhHlIBnPb1A
 BH+F7zENTyYcF2icZQh/p2n53wDwmWAeEJb3Vzlk8BYFeMV7L08vFzS0uRLVJeCMT0o4
 gVPXZZNh+wKg67MqJTA3kCOh/8gEuMOkouo6+AFSLaXTq+QWQnt18zfBKefJ5ApSx9XW
 JiHaQCwY3zFa05LYqmZ5UohyPEA0yLpG1Ig4Hh44jNAoZeL1ThUtRt0gsx9uzUTitHc9
 47kiYGhKMqI14feCyvBggSE7+0g73Lq5tAN2bOSV4NnJ70zCiCDdHsMGvN7JNLGZUiL0
 bNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772616032; x=1773220832;
 h=date:content-transfer-encoding:subject:in-reply-to:to:from
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nIYZV4wIwN0c0BMAf0MMCsM9Xjm5KWqPcbqWD98uGZ0=;
 b=kM69saZRbyQ8PKHZ4TJ2s5GWPL3yMfTKTketAN/U0z7+Ix2R7PcQ5xqaRcLylPSsYT
 ncvJlO2wAGmmsmAE7mEFAm3Qx8Bsivgn8sx1sAqr+ZVEeZSNjf7QGwGGL7cOQreI3nPU
 kwVRDjQIgsp8JQ2uOqEoFXbGz/h+G6629/rnzoEuCoyNvPEs1Jc/eimdRhM9aH7/ZoIM
 U7Tb5LSL+1svAgufJAkJH8nzIGOrYB0mPYUJ57kUsQ6HuJn9HMVvbmHXxKElj0E/VFeQ
 eBKjD1a41nNe23Kd0dmc/BDogxY98bGOF8twVPwoCD8uQEuT9NMrEMic9TrfuMDqX9Sl
 6cHA==
X-Gm-Message-State: AOJu0YzbZbmp6qRLt9KPYP+G6TrKlqFG2HqQ5rbpBQHV55IXjC+WPtCP
 j9Q9e9BQ3/QsEhZMEuUuOf2d40Gc4zga3LYE3iYfUuKTfyDwVTNiSn56tN79dNISuLWVotNaX6X
 mWMziNgM=
X-Gm-Gg: ATEYQzxlcZE67x1LAhDiSrfHBTt2G6Px4wzE6BTnSbsQxvLDf2/JrA32tr401EM90zk
 jld3SBTqGp5fwtjpU5odrqqAPQyCKw6F+ZSPai3TtzmOYwwIzstfaCjtGGbTuQqD3tFMkx1RmyQ
 NqTMr4aotpVOTgFR2GyfpYV+wkALRz6nSA7KfzXveIpw1639AQgtCw/oi643jTKVrMMAtKdC0cc
 sVqy/Pjih8C7wP+LTT/rP8Y5ecr+RzhlGONvE633jVO1VMVwOX++dClgIeX9Hq/rEddZUZKqIv9
 qFRKkoZVb/qf72npI5FZO9L1Uto9sI/fkhKuC2BDSnZaL91hF4EZppaCS8A3PRkjWa3lDafSOr1
 K1PUNXXheGMSnPoZFtGbeWN6JKs52Kslxu60i8ksgEWUPCFiNDUD9+SLuZjVUk1U/cbsSVpJPRA
 kQYEWAoc7Dy6ZAFrm6krLJWSnlY+wsDe9y5gjj6MDE2Ht62qX25GGMSdjXfvVm6jaGdAQOj6r+B
 NA97+SyCUp9BBWih4exnWIEhoFnuHlRVN4=
X-Received: by 2002:a05:600c:1986:b0:45d:d8d6:7fcc with SMTP id
 5b1f17b1804b1-48519897a4cmr19150275e9.27.1772616031649; 
 Wed, 04 Mar 2026 01:20:31 -0800 (PST)
Received: from localhost.localdomain
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851887fa9csm37916685e9.9.2026.03.04.01.20.30
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 01:20:31 -0800 (PST)
Message-ID: <69a7f95f.050a0220.23477f.af4d@mx.google.com>
To: "Li Wang via ltp" <ltp@lists.linux.it>
In-Reply-To: <20260304034034.59303-2-liwang@redhat.com>
Date: Wed, 04 Mar 2026 09:20:30 +0000
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3 2/2] lib: Extend LTP_ENABLE_DEBUG to support
 verbosity levels
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: 5CA051FD7D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	DKIM_MIXED(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_EQ_FROM(0.00)[];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:replyto,suse.com:email,mx.google.com:mid,linux.it:url,lists.linux.it:dkim,picard.linux.it:rdns,picard.linux.it:helo]
X-Rspamd-Action: no action

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>

--
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
