Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E75306FB3
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 08:42:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C3CA3C5E81
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 08:42:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 423053C2FFE
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 08:42:01 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 24A631A003CB
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 08:42:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 54D70AC97;
 Thu, 28 Jan 2021 07:42:00 +0000 (UTC)
References: <20210125131746.74630-1-lkml@jv-coder.de>
 <e573f919-8205-40e2-5187-49bff0983872@jv-coder.de>
 <YBG4hFVo5wdaFnPa@pevik>
User-agent: mu4e 1.4.14; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YBG4hFVo5wdaFnPa@pevik>
Date: Thu, 28 Jan 2021 07:41:59 +0000
Message-ID: <87a6st8q48.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] memcg/functional: Convert to newlib
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8gUGV0ciwKClBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PiB3cml0ZXM6Cgo+IEhpIErD
tnJnLAo+Cj4+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvbWVtY2cvZnVuY3Rp
b25hbC9tZW1jZ19mYWlsY250LnNoCj4+ID4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9s
bGVycy9tZW1jZy9mdW5jdGlvbmFsL21lbWNnX2ZhaWxjbnQuc2gKPj4gPiBAQCAtMSw1OCArMSwz
OSBAQAo+PiA+ICAgIyEvYmluL3NoCj4+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb3ItbGF0ZXIKPj4gPiArIyBDb3B5cmlnaHQgKGMpIDIwMDkgRlVKSVRTVSBMSU1JVEVE
Cj4+ID4gKyMgQ29weXJpZ2h0IChjKSAyMDE4LTIwMTkgQVJNIEx0ZC4gQWxsIFJpZ2h0cyBSZXNl
cnZlZC4KPj4gVGhpcyBpcyBiYWQgY29weS1hbmQtcGFzdGUgZm9yIGFsbCBmaWxlcywgd2hlcmUg
SSBtZW50aW9uZWQgYXJtLCBzb3JyeS4uLgo+IFRoYXQncyBub3QgYSBiaWcgZGVhbC4KPgo+IE9u
IGEgZmlyc3QgbG9vayBnb29kIGNsZWFudXAsIHRoYW5rIHlvdSEKPgo+IEkgaG9wZSB0aGVzZSB0
ZXN0cyBhcmVuJ3QgcGxhbm5lZCB0byBiZSByZXdyaXR0ZW4gdG8gQyAobGlrZSBOVU1BIHRlc3Rz
KS4KPiBJIHN1cHBvc2Ugbm90LCBidXQgYmV0dGVyIHRvIGFzayBlYXJsaWVyLgoKSSBjYW4gbG9v
ayBpbnRvIHRoYXQgYXMgdGhleSBzaG91bGQgdXNlIHRoZSBuZXcgKFdJUCkgQ0dyb3VwIEMgQVBJ
LiBGb3IKbm93IGl0IGlzIHByb2JhYmx5IGJlc3QgdG8ga2VlcCB0aGVtIGluIFNoZWxsLgoKPgo+
IEtpbmQgcmVnYXJkcywKPiBQZXRyCgoKLS0gClRoYW5rIHlvdSwKUmljaGFyZC4KCi0tIApNYWls
aW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
