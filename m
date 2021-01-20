Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3822D2FCA9A
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 06:30:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E50283C5DB6
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 06:29:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 4A08D3C53CC
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 06:29:57 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 89ADE600937
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 06:29:57 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id BA6BA9F7F6;
 Wed, 20 Jan 2021 05:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1611120595; bh=C99aIXdvis49a/56MtpQwkGI3VggEDoudbZz73GaUw0=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=dqefSaEEowhkaRCa19+4ecwv3CZVIESe3PxU9wcOB82bp8iovYT60Q2c+rP9I03C2
 /ZLiM/RxwoWjBFmjLTkcCeVy1mziumVlAQze/BZbLK9yCjnhXjD06XU4c671T0P0HO
 sYLZ31gGdAZOayCDTdobq3VwKDnjH2GWHqxv9jYE=
To: Petr Vorel <pvorel@suse.cz>
References: <20201215092534.757347-1-lkml@jv-coder.de> <YAa8D8iQwaQr2tAm@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <964d7c42-dcdc-321b-9b4e-f0ae540eb5c1@jv-coder.de>
Date: Wed, 20 Jan 2021 06:30:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YAa8D8iQwaQr2tAm@pevik>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] fs/lftest: Convert to new library
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUGV0ciwKCk9uIDEvMTkvMjAyMSAxMjowMSBQTSwgUGV0ciBWb3JlbCB3cm90ZToKPiBOb3Qg
c3VyZSBpZiBhbnlib2R5IHVzZXMgcnVudGVzdC9mc19yZWFkb25seSwgYnV0IHdlIHN0aWxsIGhh
dmVuJ3QgCj4gcmVtb3ZlZCBpdC4KPiBUaHVzIGl0IG11c3QgYmUgYWxzbyB1cGRhdGVkOgo+Cj4g
LXRlc3Rfcm9iaW5kNTQgdGVzdF9yb2JpbmQuc2ggLWMgImxmdGVzdCA4MCIKPiArdGVzdF9yb2Jp
bmQ1NCB0ZXN0X3JvYmluZC5zaCAtYyAibGZ0ZXN0IgpPaCBkaWQgbm90IHNlZSB0aGF0Li4uClRo
ZSBkZWZhdWx0IHBhcmFtZXRlciB0byBsZnRlc3QgaXMgbm93IDEwMCwgc28gdGhpcyBzaG91bGQg
cHJvYmFibHkgYmUKK3Rlc3Rfcm9iaW5kNTQgdGVzdF9yb2JpbmQuc2ggLWMgImxmdGVzdCAtbiA4
MApEb24ndCBrbm93IGlmIGl0IGlzIGltcG9ydGFudAoKSsO2cmcKCi0tIApNYWlsaW5nIGxpc3Qg
aW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
