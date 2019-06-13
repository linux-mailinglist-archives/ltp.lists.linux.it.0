Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EB843765
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 16:55:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4A3853EA7DD
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 16:55:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 0A1AB3EA777
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 16:55:10 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E0F7260019A
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 16:55:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3584CAC5A;
 Thu, 13 Jun 2019 14:55:08 +0000 (UTC)
Date: Thu, 13 Jun 2019 16:55:07 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Sandeep Patil <sspatil@android.com>
Message-ID: <20190613145507.GD29926@rei.lan>
References: <20190610002610.2187-1-sspatil@android.com>
 <20190610002610.2187-4-sspatil@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190610002610.2187-4-sspatil@android.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 3/3] syscalls/bind01: convert to new library.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkhClB1c2hlZCB3aXRoIG1pbm9yIGNoYW5nZXMsIHRoYW5rcy4KCkhvd2V2ZXIgdGhlIHRlc3Qg
ZmFpbHMgd2l0aCAtaSAyIGFmdGVyIHRoaXMgcGF0Y2ggc2luY2Ugb24gc2Vjb25kCml0ZXJhdGlv
biBzaW5jZSB0aGUgc29ja2V0IGlzIGFscmVhZHkgYmluZCBmb3IgdGhlIHBvc3NpdGl2ZSB0ZXN0
CmJlY2F1c2Ugd2Ugbm8gbG9uZ2VyIGNsb3NlIHRoZSBzb2NrZXQgYWZ0ZXIgZWFjaCBpdGVyYXRp
b24uIExvb2tpbmcgYXQKdGhlIGJpbmQgdGVzdHMgd2Ugc2hvdWxkIG1vdmUgdGhpcyBvbmUgaW50
byBhIHNlcGFyYXRlIHRlc3RjYXNlIGFuZCBhZGQKYSBmZXcgbW9yZSBwb3NpdGl2ZSB0ZXN0cyBh
cyB3ZWxsIHdlIHNlZW0gdG8gdGVzdCBvbmx5IEFGX0lORVQsClNPQ0tfU1RSRUFNIGNvbWJpbmF0
aW9uIHdoaWNoIGRvZXMgbm90IGV2ZW4gY292ZXIgaXB2NCBub3Igd2UgYXR0ZW1wIHRvCmNvbm5l
Y3QgdG8gdGhlIHNvY2tldCB0aGF0IGhhdmUgYmVlbiBiaW5kLgoKPiArLy8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAKCkNoYW5nZWQgdGhpcyB0byBHUEwtMi4wLW9yLWxhdGVyIHRv
IG1hdGNoIHRoZSBvcmlnaW5hbCBsaWNlbnNlLgoKQW5kIHJlbW92ZWQgdGhlIE5VTEwgcGFyYW1l
dGVyIGZyb20gdGhlIFRTVF9HRVRfVU5VU0VEX1BPUlQoKSwgc2luY2UKbmV3bGliIHZhcmlhbnQg
ZG9lcyBub3QgaGF2ZSB0aGUgY2xlYW51cCBjYWxsYmFjayBwYXJhbWV0ZXIuCgoKLS0gCkN5cmls
IEhydWJpcwpjaHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
