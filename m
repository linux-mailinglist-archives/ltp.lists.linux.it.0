Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C0755338A13
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 11:28:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 470093C60AD
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 11:28:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id F350A3C305A
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 11:28:43 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A2FA4140134B
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 11:28:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0AC55AFD8
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 10:28:43 +0000 (UTC)
Date: Fri, 12 Mar 2021 11:28:41 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YEtCWbqdGq5Yc99s@pevik>
References: <20210309171104.30821-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210309171104.30821-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Add FS quota availability check functions
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTWFydGluLAoKPiAraW50IHRzdF9jaGVja19xdW90YV9zdXBwb3J0KGNvbnN0IGNoYXIgKmRl
dmljZSwgaW50IGZvcm1hdCwKPiArCWNvbnN0IGNoYXIgKnF1b3RhZmlsZSkKPiArewo+ICsJVEVT
VChxdW90YWN0bChRQ01EKFFfUVVPVEFPTiwgVVNSUVVPVEEpLCBkZXZpY2UsIGZvcm1hdCwgcXVv
dGFmaWxlKSk7CkFjdHVhbGx5LCB0aGVyZSBpcyBhIHdhcm5pbmc6CnRzdF9zdXBwb3J0ZWRfZnNf
dHlwZXMuYzogSW4gZnVuY3Rpb24g4oCYdHN0X2NoZWNrX3F1b3RhX3N1cHBvcnTigJk6CnRzdF9z
dXBwb3J0ZWRfZnNfdHlwZXMuYzoxMTc6NTk6IHdhcm5pbmc6IHBhc3NpbmcgYXJndW1lbnQgNCBv
ZiDigJhxdW90YWN0bOKAmSBkaXNjYXJkcyDigJhjb25zdOKAmSBxdWFsaWZpZXIgZnJvbSBwb2lu
dGVyIHRhcmdldCB0eXBlIFstV2Rpc2NhcmRlZC1xdWFsaWZpZXJzXQogIDExNyB8ICBURVNUKHF1
b3RhY3RsKFFDTUQoUV9RVU9UQU9OLCBVU1JRVU9UQSksIGRldmljZSwgZm9ybWF0LCBxdW90YWZp
bGUpKTsKCldvdWxkIHlvdSBwcmVmZXIgdG8gY2FzdCB0byBjaGFyICosIG9yIGp1c3QgY2hhbmdl
IGZ1bmN0aW9uIHBhcmFtZXRlciB0byBjaGFyICo/CgpLaW5kIHJlZ2FyZHMsClBldHIKCj4gKwo+
ICsJLyogTm90IHN1cHBvcnRlZCAqLwo+ICsJaWYgKFRTVF9SRVQgPT0gLTEgJiYgVFNUX0VSUiA9
PSBFU1JDSCkKPiArCQlyZXR1cm4gMDsKPiArCj4gKwkvKiBCcm9rZW4gKi8KPiArCWlmIChUU1Rf
UkVUKQo+ICsJCXJldHVybiAtMTsKPiArCj4gKwlxdW90YWN0bChRQ01EKFFfUVVPVEFPRkYsIFVT
UlFVT1RBKSwgZGV2aWNlLCAwLCAwKTsKPiArCXJldHVybiAxOwo+ICt9CgotLSAKTWFpbGluZyBs
aXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
