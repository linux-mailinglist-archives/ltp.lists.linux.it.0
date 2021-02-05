Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A6B31075D
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 10:11:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56EFC3C70D4
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 10:11:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 609783C4F29
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 10:11:27 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 87827200FE6
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 10:11:26 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id BE211A0730;
 Fri,  5 Feb 2021 09:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1612516284; bh=Yqjh5yZchYICheB1mDlQWmZhYUYL79Ot4PR+oT7G92s=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=tMicz95s8JKhGh1wp4MvdxcQsQHAJVWePtj2+ih/HuexZ7oCMIRhEpotbx3S7ei2G
 RkoxRS8HuJc/rSbKtx/Fc/gWr6Sla6Gi8SqSqr260M1HJbC21bXVIWoouX2BBCWLn6
 WVf6m24Srcxpsvf0xXOA4rffqa+e84jgttht1ssg=
To: Cyril Hrubis <chrubis@suse.cz>
References: <0efaa481ffd24bc48fd41385159be66c@exch01.asrmicro.com>
 <f3136f18-edd5-08b7-a720-72baeeed7fbc@jv-coder.de>
 <YAGPQRoBmwg488jJ@yuki.lan>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <a08e95f6-7931-246f-4e30-8935b1b50c97@jv-coder.de>
Date: Fri, 5 Feb 2021 10:12:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YAGPQRoBmwg488jJ@yuki.lan>
Content-Language: en-US
X-Spam-Status: No, score=-0.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] LTP testcase(sysctl02) failed
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
Cc: Gao Meitao??????????????? <meitaogao@asrmicro.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpPbiAxLzE1LzIwMjEgMTo0OSBQTSwgQ3lyaWwgSHJ1YmlzIHdyb3RlOgo+IEhpIQo+PiBA
Q3lyaWwgSSBndWVzcyB5b3UgbWF5IGtub3cgaG93IGFuZCB3aG8gdG8gcmVwb3J0IHRoaXMgdG8/
Cj4gUGF0Y2hlcyBhcmUgcHJvcG9zZWQgZm9yIGluY2x1c2lvbiBpbnRvIHN0YWJsZSB0cmVlcyBh
dAo+IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgc28gSSB3b3VsZCBkcm9wIGFuIGVtYWlsIHRoZXJl
LgoKSnVzdCBGWUk6IEkgcmVwb3J0ZWQgdGhpcyBhbmQgdGhlIHBhdGNoIGlzIG5vdyBxdWV1ZWQg
Zm9yIHRoZSBuZXh0IDQuMTkKCkrDtnJnCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8v
bGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
