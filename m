Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C12117EB8D
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 22:53:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2449D3C615A
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 22:53:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 587633C6134
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 22:53:10 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AB82E200DEA
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 22:53:09 +0100 (CET)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AC2432146E;
 Mon,  9 Mar 2020 21:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583790786;
 bh=8HvFafHKYIAnGdw58ZUkwzQxxJQ0wlGlJmTvXiSzUMs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qXUvoDk2WHWlsVdsQ1snSKdtpCR9Y7uKPYKoyF4kQv7/uO1XHb1QHWPpp/EJuz6KQ
 8srnXpWOmBGRfoxx2hdlNwdpW9lgiKFSH+0x1HLBVm6UfNX2lPmu88F/LPNZWgkftn
 KlKU/mgH2oXeck/kbr5c3oFFYtQEhXG+TRRJwotU=
Date: Mon, 9 Mar 2020 17:53:05 -0400
From: Sasha Levin <sashal@kernel.org>
To: CKI Project <cki-project@redhat.com>
Message-ID: <20200309215305.GV21491@sasha-vm>
References: <cki.411617A928.D7E40QQCW6@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cki.411617A928.D7E40QQCW6@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_PANICKED=3A_Test_report_for_kernel_5?=
 =?utf-8?q?=2E5=2E8-c30f33b=2Ecki_=28stable-queue=29?=
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
 Ondrej Moris <omoris@redhat.com>, LTP Mailing List <ltp@lists.linux.it>,
 William Gomeringer <wgomeringer@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gTW9uLCBNYXIgMDksIDIwMjAgYXQgMDk6MjQ6MzVQTSAtMDAwMCwgQ0tJIFByb2plY3Qgd3Jv
dGU6Cj4KPkhlbGxvLAo+Cj5XZSByYW4gYXV0b21hdGVkIHRlc3RzIG9uIGEgcmVjZW50IGNvbW1p
dCBmcm9tIHRoaXMga2VybmVsIHRyZWU6Cj4KPiAgICAgICBLZXJuZWwgcmVwbzogaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0YWJs
ZS1yYy5naXQKPiAgICAgICAgICAgIENvbW1pdDogYzMwZjMzYmZiMDE0IC0gc2VsZnRlc3RzOiBm
b3J3YXJkaW5nOiB2eGxhbl9icmlkZ2VfMWQ6IHVzZSBtb3JlIHByb3BlciB0b3MgdmFsdWUKPgo+
VGhlIHJlc3VsdHMgb2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBwcm92aWRlZCBiZWxvdy4K
Pgo+ICAgIE92ZXJhbGwgcmVzdWx0OiBGQUlMRUQgKHNlZSBkZXRhaWxzIGJlbG93KQo+ICAgICAg
ICAgICAgIE1lcmdlOiBPSwo+ICAgICAgICAgICBDb21waWxlOiBPSwo+ICAgICAgICAgICAgIFRl
c3RzOiBQQU5JQ0tFRAo+Cj5BbGwga2VybmVsIGJpbmFyaWVzLCBjb25maWcgZmlsZXMsIGFuZCBs
b2dzIGFyZSBhdmFpbGFibGUgZm9yIGRvd25sb2FkIGhlcmU6Cj4KPiAgaHR0cHM6Ly9ja2ktYXJ0
aWZhY3RzLnMzLnVzLWVhc3QtMi5hbWF6b25hd3MuY29tL2luZGV4Lmh0bWw/cHJlZml4PWRhdGF3
YXJlaG91c2UvMjAyMC8wMy8wOS80ODAxNTgKPgo+T25lIG9yIG1vcmUga2VybmVsIHRlc3RzIGZh
aWxlZDoKPgo+ICAgIHMzOTB4Ogo+ICAgICDinYwgTFRQCj4KPiAgICBwcGM2NGxlOgo+ICAgICDi
nYwgTFRQCj4KPiAgICBhYXJjaDY0Ogo+ICAgICDinYwgYXVkaXQ6IGF1ZGl0IHRlc3RzdWl0ZSB0
ZXN0Cj4KPiAgICB4ODZfNjQ6Cj4gICAgIOKdjCBhdWRpdDogYXVkaXQgdGVzdHN1aXRlIHRlc3QK
CkZvbGxvd2luZyB0aGUgbGluayBhYm92ZSBJIGdvdCB0bwpodHRwczovL2NraS1hcnRpZmFjdHMu
czMudXMtZWFzdC0yLmFtYXpvbmF3cy5jb20vaW5kZXguaHRtbD9wcmVmaXg9ZGF0YXdhcmVob3Vz
ZS8yMDIwLzAzLzA5LzQ4MDE1OC9hdWRpdF9fYXVkaXRfdGVzdHN1aXRlX3Rlc3QvLApidXQgaXQg
c2hvd3MgdGhhdCBhbGwgdGVzdHMgYXJlIHBhc3Npbmc/IFRoZSBjb25zb2xlIGxvZyBsb29rcyBm
aW5lIHRvbzoKaHR0cHM6Ly9ja2ktYXJ0aWZhY3RzLnMzLnVzLWVhc3QtMi5hbWF6b25hd3MuY29t
L2RhdGF3YXJlaG91c2UvMjAyMC8wMy8wOS80ODAxNTgveDg2XzY0XzVfY29uc29sZS5sb2cuCldo
ZXJlJ3MgdGhlIHBhbmljPwoKLS0gClRoYW5rcywKU2FzaGEKCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
