Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E161C5235
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 11:51:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C4EA63C5807
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 11:51:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 7DD233C262E
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:51:33 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 858A0200CE1
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:51:32 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id u10so606629pls.8
 for <ltp@lists.linux.it>; Tue, 05 May 2020 02:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=+/rLyUt7Kp3eUe8P6bw3Edhcqsquw5zXPE218hJ1LG0=;
 b=EtqHJNSuwfMDDPqcfekjGJqbQi7HxSBUk7Wf4Ir1lr5n2VfnkDsYYLaFJtIiCwdnai
 aJpKYIBxJWhV48hTZpPkPcSMzvZgIlMaS1saSrAhMINGClZZCWsnQUtQwH7PldazDeef
 BtLOsRiphRJH6gGlAf8yI3uzikk8QATBgQ9TX9DVkLFkuTnaHzrHIXLXfjePKpj5zlWI
 pvPGKYZPBBK2tOFPEnctiHZK8HKgqTk+cY0vcJwyjo/rsgzyPSCtkqlPYPq5PjiLNN8+
 nb+bWoch/hOhixE/f6sZUkxqkSWfx92uQtabwRgMuALkuGwlfhygptC42GKTSQCtDubc
 6PdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=+/rLyUt7Kp3eUe8P6bw3Edhcqsquw5zXPE218hJ1LG0=;
 b=pANUJRgxkEipeWiBtNiZCu6K2CU0B0Dxp1KKG6BBT0xeutEBMXonUanVBcNeEj7Ujv
 UQjJqtSTc/UOTQPApA49cFMjN315uibsaiDzOCfO3YWZrSrDXPoYDbzZHxCSiAyRBkYX
 qsr21NU/UBVoUDuVW7bSptYmNdyQFbWU5WsXh8au3m27plfWDEGLB9rKsY6xa8VKjD6e
 rlPn8k9AgpS3jCuYweh7EuAM9cqmi/fy5PkEu9/SMwhtHHIeAh7+y8OvspxV/7bTO6Xd
 7CMUt6EUwqirnq2xGdiNFTsgXNMU1N7PiRZy5LC1PbQ5kNs2rVSyuhHwXNKwrdze4rGE
 JAZA==
X-Gm-Message-State: AGi0Pubd+G2cXZRD1gAlDkx+jIKPLjZTz5aQz4Mdb5Yy7nGw1IEmejHv
 P/+UWDguPgw/SvMr9qh3qJ4jhg==
X-Google-Smtp-Source: APiQypJqSGywo3TLfDO9vAi9E7z4fV+qH4Tm+Wa89vI2nv6LnHzpDdFB86Yskys3RtZS2a3Trbd4Vg==
X-Received: by 2002:a17:90b:4d09:: with SMTP id
 mw9mr2086412pjb.55.1588672291004; 
 Tue, 05 May 2020 02:51:31 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id z5sm1577452pfz.109.2020.05.05.02.51.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 May 2020 02:51:30 -0700 (PDT)
Date: Tue, 5 May 2020 15:21:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <20200505095128.rc5epchamxcx44pp@vireshk-i7>
References: <20200430085742.1663-1-yangx.jy@cn.fujitsu.com>
 <20200430085742.1663-2-yangx.jy@cn.fujitsu.com>
 <20200504051107.edvfiqloegt3ak5o@vireshk-i7>
 <b74eac89-11fc-9a7c-c337-ffe6f19ec7b8@163.com>
 <20200505033507.oerhoby6aif3leea@vireshk-i7>
 <c63909b8-a666-bf56-c747-78eff8c138b3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c63909b8-a666-bf56-c747-78eff8c138b3@163.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/pidfd_open*.c: Drop .min_kver flag
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMDUtMDUtMjAsIDE3OjMwLCBYaWFvIFlhbmcgd3JvdGU6Cj4gSSB0aGluayBURVNUKCkgaXMg
c3VycGx1cyBiZWNhdXNlIGZkIGFuZCBURVJSTk8gaXMgZW5vdWdoIHRvIGZpbmlzaCBjaGVjawo+
IHBvaW50Lgo+IAo+IEl0IGlzIG5vdCBhbiBpbXBvcnRhbnQgY2hhbmdlIGFuZCBJIHdpbGwga2Vl
cCBpdCBpZiB5b3UgYW5kIEN5cmlsIHByZWZlciB0bwo+IHVzZSBURVNUKCkuCgoKPiBJdCBpcyBq
dXN0IGEgcG9zc2libGUgc2l0dWF0aW9u77yMIGZvciBleGFtcGxlOgo+IAo+IFVwc3RyZWFtIGtl
cm5lbCBpbnRyb2R1Y2VzIGJ0cmZzIGZpbGVzeXN0ZW0gbG9uZyBsb25nIGFnbyBidXQgdGhlIGtl
cm5lbAo+IAo+IG9mIFJIRUw4IGRyb3BzIGJ0cmZzIGZpbGVzeXN0ZW0gYmVjYXVzZSBvZiBzb21l
IHJlYXNvbnMuCgpJIHdpbGwgbGV0IEN5cmlsIGRlY2lkZSBvbiB0aGVzZSA6KQoKVGhhbmtzIFhp
YW8uCgotLSAKdmlyZXNoCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
