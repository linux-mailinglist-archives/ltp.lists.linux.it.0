Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 121A410CE12
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 18:47:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E6133C22D0
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 18:47:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 55F863C0EAF
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 18:47:37 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C53F6601842
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 18:47:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CE702AAC3
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 17:47:34 +0000 (UTC)
Date: Thu, 28 Nov 2019 18:47:33 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20191128174733.GA5202@dell5510>
References: <20191128093610.6903-1-mdoucha@suse.cz>
 <20191128093610.6903-2-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191128093610.6903-2-mdoucha@suse.cz>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] Use real FS block size in fallocate05
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

SGkgTWFydGluLAoKTG9va3Mgb2sgdG8gbWUuCgpCVFcgdGhlcmUgaXMgY2hhbmdlIG9uIHJlc3Vs
dHMgb24gc29tZSBvZiBteSBWTToKCk9sZCB2ZXJzaW9uOgp0c3RfdGVzdC5jOjExNjk6IElORk86
IFRlc3Rpbmcgb24gZXh0NAp0c3RfbWtmcy5jOjg5OiBJTkZPOiBGb3JtYXR0aW5nIC9kZXYvbG9v
cDAgd2l0aCBleHQ0IG9wdHM9JycgZXh0cmEgb3B0cz0nJwpta2UyZnMgMS40My44ICgxLUphbi0y
MDE4KQp0c3RfdGVzdC5jOjExMDY6IElORk86IFRpbWVvdXQgcGVyIHJ1biBpcyAwaCAwNW0gMDBz
CnRzdF9maWxsX2ZzLmM6Mjk6IElORk86IENyZWF0aW5nIGZpbGUgbW50cG9pbnQvZmlsZTAgc2l6
ZSAyMTcxMDE4Mwp0c3RfZmlsbF9mcy5jOjI5OiBJTkZPOiBDcmVhdGluZyBmaWxlIG1udHBvaW50
L2ZpbGUxIHNpemUgODA3MDA4Ngp0c3RfZmlsbF9mcy5jOjI5OiBJTkZPOiBDcmVhdGluZyBmaWxl
IG1udHBvaW50L2ZpbGUyIHNpemUgMzk3MTE3Nwp0c3RfZmlsbF9mcy5jOjI5OiBJTkZPOiBDcmVh
dGluZyBmaWxlIG1udHBvaW50L2ZpbGUzIHNpemUgMzY5MTUzMTUKdHN0X2ZpbGxfZnMuYzoyOTog
SU5GTzogQ3JlYXRpbmcgZmlsZSBtbnRwb2ludC9maWxlNCBzaXplIDcwMzEwOTkzCnRzdF9maWxs
X2ZzLmM6Mjk6IElORk86IENyZWF0aW5nIGZpbGUgbW50cG9pbnQvZmlsZTUgc2l6ZSA0ODA3OTM1
CnRzdF9maWxsX2ZzLmM6Mjk6IElORk86IENyZWF0aW5nIGZpbGUgbW50cG9pbnQvZmlsZTYgc2l6
ZSA5MDczOTc4Ngp0c3RfZmlsbF9mcy5jOjI5OiBJTkZPOiBDcmVhdGluZyBmaWxlIG1udHBvaW50
L2ZpbGU3IHNpemUgNzY4OTY0OTIKdHN0X2ZpbGxfZnMuYzo0OTogSU5GTzogd3JpdGUoKTogRU5P
U1BDCmZhbGxvY2F0ZTA1LmM6NTA6IFBBU1M6IHdyaXRlKCkgd3JvdGUgODE5MiBieXRlcwpmYWxs
b2NhdGUwNS5jOjU5OiBQQVNTOiBmYWxsb2NhdGUoKSBvbiBmdWxsIEZTOiBFTk9TUEMKZmFsbG9j
YXRlMDUuYzo2ODogUEFTUzogZmFsbG9jYXRlKEZBTExPQ19GTF9QVU5DSF9IT0xFIHwgRkFMTE9D
X0ZMX0tFRVBfU0laRSkKZmFsbG9jYXRlMDUuYzo3NDogUEFTUzogd3JpdGUoKQoKV2l0aCB5b3Vy
IHBhdGNoOgouLi4KdHN0X2ZpbGxfZnMuYzo0OTogSU5GTzogd3JpdGUoKTogRU5PU1BDICgyOCkK
ZmFsbG9jYXRlMDUuYzo2NzogUEFTUzogd3JpdGUoKSB3cm90ZSAxNjM4NCBieXRlcwpmYWxsb2Nh
dGUwNS5jOjczOiBGQUlMOiBmYWxsb2NhdGUoKSBzdWNjZWVkZWQgdW5leHBlY3RlZGx5CgpNYXli
ZSBpdCdzIGNvcnJlY3QgKHByZXZpb3VzIHZlcnNpb24gZGlkbid0IGNhdGNoIGEgcHJvYmxlbSks
Cm5vdCByZWFsbHkgc3VyZS4KCisgdGhlcmUgYXJlIGZldyBzaW1wbGUgd2FybmluZ3M6Ci4uLy4u
Ly4uLy4uL2luY2x1ZGUvdHN0X3Rlc3QuaDo3MDo0MTogd2FybmluZzogZm9ybWF0IOKAmCVp4oCZ
IGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhpbnTigJksIGJ1dCBhcmd1bWVudCA1IGhhcyB0
eXBlIOKAmHNpemVfdOKAmSB7YWthIOKAmGxvbmcgdW5zaWduZWQgaW504oCZfSBbLVdmb3JtYXQ9
XQogICA3MCB8ICAgdHN0X2Jya18oX19GSUxFX18sIF9fTElORV9fLCAodHR5cGUpLCAoYXJnX2Zt
dCksICMjX19WQV9BUkdTX18pO1wKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXn5+fn5+fn5+CmZhbGxvY2F0ZTA1LmM6NTM6Mzogbm90ZTogaW4gZXhwYW5z
aW9uIG9mIG1hY3JvIOKAmHRzdF9icmvigJkKICAgNTMgfCAgIHRzdF9icmsoVEJST0sgfCBUVEVS
Uk5PLCAiZmFsbG9jYXRlKGZkLCAwLCAwLCAlaSkiLCBidWZzaXplKTsKICAgICAgfCAgIF5+fn5+
fn4KZmFsbG9jYXRlMDUuYzo2MjoxOTogd2FybmluZzogY29tcGFyaXNvbiBvZiBpbnRlZ2VyIGV4
cHJlc3Npb25zIG9mIGRpZmZlcmVudCBzaWduZWRuZXNzOiDigJhsb25nIGludOKAmSBhbmQg4oCY
c2l6ZV904oCZIHtha2Eg4oCYbG9uZyB1bnNpZ25lZCBpbnTigJl9IFstV3NpZ24tY29tcGFyZV0K
ICAgNjIgfCAgZWxzZSBpZiAoVFNUX1JFVCAhPSBidWZzaXplKQogICAgICB8ICAgICAgICAgICAg
ICAgICAgIF5+CmZhbGxvY2F0ZTA1LmM6Mjc6MTg6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSDi
gJhp4oCZIFstV3VudXNlZC12YXJpYWJsZV0KICAgMjcgfCAgc2l6ZV90IGJ1ZnNpemUsIGk7CiAg
ICAgIHwgICAgICAgICAgICAgICAgICBeCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
