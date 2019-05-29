Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB312D45E
	for <lists+linux-ltp@lfdr.de>; Wed, 29 May 2019 05:56:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 62DBB294ADE
	for <lists+linux-ltp@lfdr.de>; Wed, 29 May 2019 05:56:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 4CE8C3EA16D
 for <ltp@lists.linux.it>; Wed, 29 May 2019 05:56:36 +0200 (CEST)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CB787200C11
 for <ltp@lists.linux.it>; Wed, 29 May 2019 05:56:33 +0200 (CEST)
Received: from callcc.thunk.org ([66.31.38.53]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x4T3uDxh003771
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 May 2019 23:56:14 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 30068420481; Tue, 28 May 2019 23:56:13 -0400 (EDT)
Date: Tue, 28 May 2019 23:56:13 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: kernel test robot <rong.a.chen@intel.com>
Message-ID: <20190529035613.GA6210@mit.edu>
Mail-Followup-To: Theodore Ts'o <tytso@mit.edu>,
 kernel test robot <rong.a.chen@intel.com>, Jan Kara <jack@suse.cz>,
 Ira Weiny <ira.weiny@intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, lkp@01.org,
 ltp@lists.linux.it
References: <20190529025256.GB22325@shao2-debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190529025256.GB22325@shao2-debian>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jan Kara <jack@suse.cz>,
 Ira Weiny <ira.weiny@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 lkp@01.org, ltp@lists.linux.it
Subject: Re: [LTP] [ext4] 079f9927c7: ltp.mmap16.fail
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

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMTA6NTI6NTZBTSArMDgwMCwga2VybmVsIHRlc3Qgcm9i
b3Qgd3JvdGU6Cj4gRllJLCB3ZSBub3RpY2VkIHRoZSBmb2xsb3dpbmcgY29tbWl0IChidWlsdCB3
aXRoIGdjYy03KToKPiAKPiBjb21taXQ6IDA3OWY5OTI3YzdiZmEwMjZkOTYzZGIxNDU1MTk3MTU5
ZWJlNWI1MzQgKCJleHQ0OiBncmFjZWZ1bGx5IGhhbmRsZSBleHQ0X2JyZWFrX2xheW91dHMoKSBm
YWlsdXJlIGR1cmluZyB0cnVuY2F0ZSIpCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9jZ2l0L2xp
bnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdCBtYXN0ZXIKCkphbiAtLS0gdGhpcyBp
cyB0aGUgb2xkIHZlcnNpb24gb2YgeW91ciBwYXRjaCwgd2hpY2ggSSBoYWQgZHJvcHBlZApiZWZv
cmUgc2VuZGluZyBhIHB1c2ggcmVxdWVzdCB0byBMaW51cy4gIEhvd2V2ZXIsIEkgZm9yZ290IHRv
IHJlc2V0CnRoZSBkZXYgYnJhbmNoIHNvIGl0IHN0aWxsIGhhZCB0aGUgb2xkIHBhdGNoIG9uIGl0
LCBhbmQgc28gaXQgZ290CnBpY2tlZCB1cCBpbiBsaW51eC1uZXh0LiAgQXBvbG9naWVzIGZvciB0
aGUgY29uZnVzaW9uLgoKSSd2ZSByZXNldCB0aGUgZGV2IGJyYW5jaCBvbiBleHQ0LmdpdCwgYW5k
IHRoZSBuZXcgdmVyc2lvbiBvZiB5b3VyCnBhdGNoIHdpbGwgc2hvdyB1cCB0aGVyZSBzaG9ydGx5
LCBhcyBJIHN0YXJ0IHJldmlld2luZyBwYXRjaGVzIGZvciB0aGUKbmV4dCBtZXJnZSB3aW5kb3cu
CgpDaGVlcnMsCgoJCQkJCS0gVGVkCgo+IDw8PHRlc3Rfc3RhcnQ+Pj4KPiB0YWc9bW1hcDE2IHN0
aW1lPTE1NTkwNzg3MDYKPiBjbWRsaW5lPSJtbWFwMTYiCj4gY29udGFjdHM9IiIKPiBhbmFseXNp
cz1leGl0Cj4gPDw8dGVzdF9vdXRwdXQ+Pj4KPiBta2UyZnMgMS40My40ICgzMS1KYW4tMjAxNykK
PiBtbWFwMTYgICAgICAwICBUSU5GTyAgOiAgVXNpbmcgdGVzdCBkZXZpY2UgTFRQX0RFVj0nL2Rl
di9sb29wMCcKPiBtbWFwMTYgICAgICAwICBUSU5GTyAgOiAgRm9ybWF0dGluZyAvZGV2L2xvb3Aw
IHdpdGggZXh0NCBvcHRzPSctYiAxMDI0JyBleHRyYSBvcHRzPScxMDI0MCcKPiBtbWFwMTYgICAg
ICAxICBURkFJTCAgOiAgbW1hcDE2LmM6ODU6IEJ1ZyBpcyByZXByb2R1Y2VkIQo+IDw8PGV4ZWN1
dGlvbl9zdGF0dXM+Pj4KPiBpbml0aWF0aW9uX3N0YXR1cz0ib2siCj4gZHVyYXRpb249OCB0ZXJt
aW5hdGlvbl90eXBlPWV4aXRlZCB0ZXJtaW5hdGlvbl9pZD0xIGNvcmVmaWxlPW5vCj4gY3V0aW1l
PTExIGNzdGltZT0zNDUKPiA8PDx0ZXN0X2VuZD4+PgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBo
dHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
