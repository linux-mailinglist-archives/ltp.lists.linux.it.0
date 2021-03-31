Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8360C35010D
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Mar 2021 15:18:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E07E53C8A4D
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Mar 2021 15:18:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F0AFB3C2793
 for <ltp@lists.linux.it>; Wed, 31 Mar 2021 15:18:04 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 391A51A01142
 for <ltp@lists.linux.it>; Wed, 31 Mar 2021 15:18:03 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30012AEB9;
 Wed, 31 Mar 2021 13:18:03 +0000 (UTC)
Date: Wed, 31 Mar 2021 15:18:01 +0200
From: Petr Vorel <pvorel@suse.cz>
To: =?utf-8?B?6IuP5a626K6t?= <sujiaxun@uniontech.com>
Message-ID: <YGR2iTMUNUTuhbMw@pevik>
References: <20210330130115.26575-1-sujiaxun@uniontech.com>
 <YGRPZF+DJy/jAZRN@pevik>
 <762779324.75038.1617189402948.JavaMail.xmail@bj-wm-cp-5>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <762779324.75038.1617189402948.JavaMail.xmail@bj-wm-cp-5>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] bugfix for cpio/cpio_tests.sh
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

SGksCgo+ID4gSW4gY3BpbyB2ZXJzaW9uIDIuMTIgYW5kIDIuMTMsJ2NwaW8gLS1oZWxwJyBjcmVh
dGUgaXMgbG93ZXJjYXNlIMKgCj4gwqAKPiA+IC0gaWYgISBjcGlvIC0taGVscCAyPiYxIHwgZ3Jl
cCAtcSAtLSAnLW8uKkNyZWF0ZSc7IHRoZW4gwqAKPiA+ICsgaWYgISBjcGlvIC0taGVscCAyPiYx
IHwgZ3JlcCAtcWkgLS0gJy1vLipDcmVhdGUnOyB0aGVuIMKgCgo+IFNvcnJ5LCBJIHRob3VnaHQg
dGhlIHNlYXJjaCB3YXMg4oCYLS1jcmVhdGXigJkgYWZ0ZXIg4oCYLW/igJkuIEluIHRoZSBFbmds
aXNoCj4gZW52aXJvbm1lbnQsIHRoZXJlIGlzIGluZGVlZCDigJhDcmVhdGXigJkgaW4gdGhlIGRl
c2NyaXB0aW9uLgoKPiDCoMKgLWkswqAtLWV4dHJhY3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgRXh0cmFjdMKgZmlsZXPCoGZyb23CoGFuwqBhcmNoaXZlCj4gwqDCoC1vLMKgLS1jcmVhdGXC
oCDCoCDCoCDCoCDCoCDCoCDCoCBDcmVhdGXCoHRoZcKgYXJjaGl2ZQoKVGhhbmtzIGZvciBjbGFy
aWZpY2F0aW9uLiAgTm8sIGxvbmcgb3B0aW9uIC0tY3JlYXRlIGRvZXMgbm90IGV4aXN0IGluIGJ1
c3lib3gKaW1wbGVtZW50YXRpb24sIHRoZXJlIGlzIG9ubHkgc2hvcnQgb3B0aW9uIC1vLiBJIG1l
YW4gaXQgd291bGRuJ3QgaGFybSB0byBoYXZlCidncmVwIC1pJywgYnV0IHVudGlsIG5lZWRlZCwg
SSBwcmVmZXIgdG8gbm90IGFkZGluZyBpdC4KCmNwaW8gaW1wbGVtZW50YXRpb246CiAgLW8sIC0t
Y3JlYXRlICAgICAgICAgICAgICAgQ3JlYXRlIHRoZSBhcmNoaXZlIChydW4gaW4gY29weS1vdXQg
bW9kZSkKCmJ1c3lib3ggaW1wbGVtZW50YXRpb246CgktbwlDcmVhdGUgKHJlcXVpcmVzIC1IIG5l
d2MpCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
