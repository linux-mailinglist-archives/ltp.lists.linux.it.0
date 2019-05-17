Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6E921A45
	for <lists+linux-ltp@lfdr.de>; Fri, 17 May 2019 17:05:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97B233EA5BF
	for <lists+linux-ltp@lfdr.de>; Fri, 17 May 2019 17:05:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 96EFC3EA58C
 for <ltp@lists.linux.it>; Fri, 17 May 2019 17:05:02 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 397B1602323
 for <ltp@lists.linux.it>; Fri, 17 May 2019 17:05:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 772F3AF3A;
 Fri, 17 May 2019 15:04:59 +0000 (UTC)
Date: Fri, 17 May 2019 17:04:56 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Nayna <nayna@linux.vnet.ibm.com>
Message-ID: <20190517150456.GA11796@dell5510>
References: <1558041162.3971.2.camel@linux.ibm.com>
 <fccc3abd-f3ce-fdb1-55d7-c18ce116446c@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fccc3abd-f3ce-fdb1-55d7-c18ce116446c@linux.vnet.ibm.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: linux-integrity <linux-integrity@vger.kernel.org>, ltp@lists.linux.it,
 Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [LTP] [PATCH] ima: skip verifying TPM 2.0 PCR values
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTmF5bmEsCgouLi4KPiA+ICsJbG9jYWwgdHBtX2Rlc2NyaXB0aW9uPSIvc3lzL2NsYXNzL3Rw
bS90cG0wL2RldmljZS9kZXNjcmlwdGlvbiIKLi4uCgo+IEkgZG8gbm90IHNlZSBhICJkZXNjcmlw
dGlvbiIgZmlsZSBvbiBlaXRoZXIgbXkgUG93ZXJQQyBvciB4ODYgc3lzdGVtcyB3aXRoCj4gVFBN
IDIuMC7CoCBQZXJoYXBzIGluc3RlYWQgb2YgdGVzdGluZyBmb3IgdGhlICJkZXNjcmlwdGlvbiIg
ZmlsZSwgaWYgdGhlCj4gInBjcnMiIGZpbGUgaXMgbm90IGZvdW5kLCBlbWl0IGEgbW9yZSB2ZXJi
b3NlIGluZm9ybWF0aW9uYWwgbWVzc2FnZSwgZm9yIGVnLgo+IC0gInBjcnMgZmlsZSBpcyBub3Qg
Zm91bmQgLSBlaXRoZXIgeW91IGFyZSBydW5uaW5nIGEgVFBNIDIuMCwgb3IgaGF2aW5nCj4gc3lz
ZnMgZmFpbGVkIHRvIHNob3cgcGNycyBmb3IgVFBNIDEuMiIKU29tZSBwZW9wbGUgYXJlIHVzaW5n
IC9zeXMvY2xhc3MvdHBtL3RwbTAvZGV2aWNlL2Rlc2NyaXB0aW9uIFsxXSBmb3IgdGVzdGluZyBU
UE0KdmVyc2lvbi4gRnJvbSB0aGUgZGlzY3Vzc2lvbiBvbiBbMV0gSSBhbHNvIGdvdCBhbiBleHBy
ZXNzaW9uIHRoYXQgdGhlIGZpbGUgaXMKbm90IGFsd2F5cyBwcmVzZW50ZWQuIElmIHRoZXJlIGlz
IHJlYWxseSBubyByZWxpYWJsZSB3YXkgdG8gZGV0ZWN0IFRQTSB2ZXJzaW9uCmZyb20gc3lzZnMg
KGh1aCEpIHlvdXIgYXBwcm9hY2ggd291bGQgbWFrZSBzZW5zZSBmb3IgbWUuCgo+IFRoYW5rcyAm
IFJlZ2FyZHMsCj4gwqDCoMKgwqDCoCAtIE5heW5hCgpLaW5kIHJlZ2FyZHMsClBldHIKClsxXSBo
dHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL2lzc3Vlcy82MDQKCi0t
IApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
