Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EC44A18EDCC
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 02:58:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ABC703C4F29
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 02:58:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 27B323C0716
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 02:58:33 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 87B3E600D14
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 02:58:32 +0100 (CET)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C95FB20722;
 Mon, 23 Mar 2020 01:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584928710;
 bh=w1tcwWtpPMAsA+9omi4eLsU7Mm02AQjta+kf1gJR46c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pZ7WI4A5+SblgQqaH5kLb2zlWYWeKGnx6+tt5Gye10mhj3UeJUdRUdnvKPYggXKKr
 IKtWZ7WpAvcCf+iQN4T2aO8R+7NyxGZ0e9HpwsoHYxTSKxFhuu7jwAkV2X+264+/JQ
 LANFF7NlU/fmxQjTQQQnK0qxg9Ar1AU8juefv40U=
Date: Sun, 22 Mar 2020 21:58:28 -0400
From: Sasha Levin <sashal@kernel.org>
To: CKI Project <cki-project@redhat.com>
Message-ID: <20200323015828.GS4189@sasha-vm>
References: <cki.D9E02DA05E.6L1W61X8RG@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cki.D9E02DA05E.6L1W61X8RG@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=F0=9F=92=A5_PANICKED=3A_Test_report_for_kernel_?=
 =?utf-8?q?5=2E5=2E11-6df57ed=2Ecki_=28stable-queue=29?=
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
Cc: Memory Management <mm-qe@redhat.com>, Ondrej Mosnacek <omosnace@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>,
 Ondrej Moris <omoris@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gU3VuLCBNYXIgMjIsIDIwMjAgYXQgMTE6NTA6MTFQTSAtMDAwMCwgQ0tJIFByb2plY3Qgd3Jv
dGU6Cj4KPkhlbGxvLAo+Cj5XZSByYW4gYXV0b21hdGVkIHRlc3RzIG9uIGEgcmVjZW50IGNvbW1p
dCBmcm9tIHRoaXMga2VybmVsIHRyZWU6Cj4KPiAgICAgICBLZXJuZWwgcmVwbzogaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0YWJs
ZS1yYy5naXQKPiAgICAgICAgICAgIENvbW1pdDogNmRmNTdlZDE0ZGRmIC0gUmV2ZXJ0ICJkcm0v
ZmJkZXY6IEZhbGxiYWNrIHRvIG5vbiB0aWxlZCBtb2RlIGlmIGFsbCB0aWxlcyBub3QgcHJlc2Vu
dCIKPgo+VGhlIHJlc3VsdHMgb2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBwcm92aWRlZCBi
ZWxvdy4KPgo+ICAgIE92ZXJhbGwgcmVzdWx0OiBGQUlMRUQgKHNlZSBkZXRhaWxzIGJlbG93KQo+
ICAgICAgICAgICAgIE1lcmdlOiBPSwo+ICAgICAgICAgICBDb21waWxlOiBPSwo+ICAgICAgICAg
ICAgIFRlc3RzOiBQQU5JQ0tFRAo+Cj5BbGwga2VybmVsIGJpbmFyaWVzLCBjb25maWcgZmlsZXMs
IGFuZCBsb2dzIGFyZSBhdmFpbGFibGUgZm9yIGRvd25sb2FkIGhlcmU6Cj4KPiAgaHR0cHM6Ly9j
a2ktYXJ0aWZhY3RzLnMzLnVzLWVhc3QtMi5hbWF6b25hd3MuY29tL2luZGV4Lmh0bWw/cHJlZml4
PWRhdGF3YXJlaG91c2UvMjAyMC8wMy8yMi81MDA2MDAKPgo+T25lIG9yIG1vcmUga2VybmVsIHRl
c3RzIGZhaWxlZDoKPgo+ICAgIHBwYzY0bGU6Cj4gICAgIOKdjCBMVFAKPgo+ICAgIGFhcmNoNjQ6
Cj4gICAgIOKdjCBCb290IHRlc3QKPgo+ICAgIHg4Nl82NDoKPiAgICAg8J+SpSB4ZnN0ZXN0cyAt
IGV4dDQKClNvIEkgZ28gaW4gdGhlIHhmc3Rlc3RzX19fZXh0NC8gZGlyZWN0b3J5IHRvIHNlZSB3
aGF0IHBhbmljZWQsIHJpZ2h0PyBJCmRvbid0IHNlZSBwYW5pY3MgaW4gdGhvc2UgbG9ncy4uLgoK
LS0gClRoYW5rcywKU2FzaGEKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5s
aW51eC5pdC9saXN0aW5mby9sdHAK
