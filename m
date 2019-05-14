Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A1C1CFBE
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 21:19:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8CA7A294AC0
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 21:19:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 345F6294AB1
 for <ltp@lists.linux.it>; Tue, 14 May 2019 21:19:08 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B36C8601BE1
 for <ltp@lists.linux.it>; Tue, 14 May 2019 21:19:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 451A1AFA7;
 Tue, 14 May 2019 19:19:05 +0000 (UTC)
To: Petr Vorel <pvorel@suse.cz>
References: <20190405165225.27216-1-pvorel@suse.cz>
 <20190514121213.GA28655@dell5510>
From: Ignaz Forster <iforster@suse.de>
Message-ID: <bf41c3b5-baf4-ba7a-2136-dabbbb817473@suse.de>
Date: Tue, 14 May 2019 21:19:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514121213.GA28655@dell5510>
Content-Type: multipart/mixed; boundary="------------49C997E5FF1975606F3D768B"
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: Fabian Vogt <FVogt@suse.com>, linux-integrity@vger.kernel.org,
 Marcus Meissner <meissner@suse.com>, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 0/3] LTP reproducer on broken IMA on overlayfs
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--------------49C997E5FF1975606F3D768B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Petr,

Am 14.05.19 um 14:12 Uhr schrieb Petr Vorel:
> Could you, please, share your setup?

The system was installed with IMA and EVM enabled during installation, 
using the following kernel parameters:
"ima_policy=appraise_tcb ima_appraise=fix evm=fix"

The EVM key was generated in the live system before starting the actual 
installation and copied into the installed system later.

See the attached installation notes for an openSUSE system (which should 
also be usable on other distributions).

> ima_policy=appraise_tcb kernel parameter and loading IMA and EVM keys over
> dracut-ima scripts?

Exactly.

> (IMA appraisal and EVM using digital signatures? I guess
> using hashes for IMA appraisal would work as well).

I focused on hashes, as those are more relevant for the overlayfs use 
case I was thinking of.

Ignaz

--------------49C997E5FF1975606F3D768B
Content-Type: text/plain; charset=UTF-8;
 name="IMA_EVM.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="IMA_EVM.txt"

TWFudWFsIElNQSAvIEVWTSBpbnN0YWxsYXRpb246CiogVXNlIGEgbmV0IGluc3RhbGwgaW1h
Z2UgKHNvbWUgb2YgdGhlIG5lY2Vzc2FyeSBwYWNrYWdlcyBhcmUgbm90IGF2YWlsYWJsZSBp
biBEVkQgaW1hZ2UpCiogQm9vdCBpbnN0YWxsIHN5c3RlbSB3aXRoICJpbWFfcG9saWN5PWFw
cHJhaXNlX3RjYiBpbWFfYXBwcmFpc2U9Zml4IGV2bT1maXgiIChmb3IgSU1BIG1lYXN1cmVt
ZW50LCBJTUEgYXBwcmFpc2FsIGFuZCBFVk0gcHJvdGVjdGlvbikKKiBQcm9jZWVkIHdpdGgg
aW5zdGFsbGF0aW9uIHVudGlsIHN1bW1hcnkgc2NyZWVuLCBidXQgZG8gbm90IHN0YXJ0IHRo
ZSBpbnN0YWxsYXRpb24geWV0CiogUmVtb3ZlICJldm09Zml4IiBmcm9tIGtlcm5lbCBib290
IHBhcmFtZXRlcnMKKiBDaGFuZ2Uga2VybmVsIGJvb3QgcGFyYW1ldGVyICJpbWFfYXBwcmFp
c2U9Zml4IiB0byAiaW1hX2FwcHJhaXNlPWFwcHJhaXNlX3RjYiIKKiBTZWxlY3QgcGFja2Fn
ZSAiZHJhY3V0LWltYSIgKHJlcXVpcmVkIGZvciBlYXJseSBib290IEVWTSBzdXBwb3J0KSBm
b3IgaW5zdGFsbGF0aW9uCiogQ2hhbmdlIHRvIGEgY29uc29sZSB3aW5kb3cKKiBta2RpciAv
ZXRjL2tleXMKKiAvYmluL2tleWN0bCBhZGQgdXNlciBrbWstdXNlciAiYGRkIGlmPS9kZXYv
dXJhbmRvbSBicz0xIGNvdW50PTMyIDI+L2Rldi9udWxsYCIgQHUKKiAvYmluL2tleWN0bCBw
aXBlIGAvYmluL2tleWN0bCBzZWFyY2ggQHUgdXNlciBrbWstdXNlcmAgPiAvZXRjL2tleXMv
a21rLXVzZXIuYmxvYgoqIC9iaW4va2V5Y3RsIGFkZCBlbmNyeXB0ZWQgZXZtLWtleSAibmV3
IHVzZXI6a21rLXVzZXIgNjQiIEB1CiogL2Jpbi9rZXljdGwgcGlwZSBgL2Jpbi9rZXljdGwg
c2VhcmNoIEB1IGVuY3J5cHRlZCBldm0ta2V5YCA+L2V0Yy9rZXlzL2V2bS5ibG9iCiogY2F0
IDw8RU5EID4vZXRjL3N5c2NvbmZpZy9tYXN0ZXJrZXkKTUFTVEVSS0VZVFlQRT0idXNlciIK
TUFTVEVSS0VZPSIvZXRjL2tleXMva21rLXVzZXIuYmxvYiIKRU5ECiogY2F0IDw8RU5EID4v
ZXRjL3N5c2NvbmZpZy9ldm0KRVZNS0VZPSIvZXRjL2tleXMvZXZtLmJsb2IiCkVORAoqIG1v
dW50IC10IHNlY3VyaXR5ZnMgc2VjdXJpdHkgL3N5cy9rZXJuZWwvc2VjdXJpdHkKKiBlY2hv
IDEgPi9zeXMva2VybmVsL3NlY3VyaXR5L2V2bQoqIEdvIGJhY2sgdG8gdGhlIGluc3RhbGxh
dGlvbiBzdW1tYXJ5IHNjcmVlbiBhbmQgc3RhcnQgdGhlIGluc3RhbGxhdGlvbgoqIER1cmlu
ZyB0aGUgaW5zdGFsbGF0aW9uIGV4ZWN1dGUgdGhlIGZvbGxvd2luZyBjb21tYW5kcyBmcm9t
IHRoZSBjb25zb2xlOgoqIGNwIC1yIC9ldGMva2V5cyAvbW50L2V0Yy8KKiBjcCAvZXRjL3N5
c2NvbmZpZy97ZXZtLG1hc3RlcmtleX0gL21udC9ldGMvc3lzY29uZmlnLw==
--------------49C997E5FF1975606F3D768B
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--------------49C997E5FF1975606F3D768B--
