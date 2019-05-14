Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2951C816
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 14:01:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B7033294AE8
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 14:01:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 682AC294AA9
 for <ltp@lists.linux.it>; Tue, 14 May 2019 14:01:23 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3764220121B
 for <ltp@lists.linux.it>; Tue, 14 May 2019 14:01:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 59CD6AFCF;
 Tue, 14 May 2019 12:01:21 +0000 (UTC)
Date: Tue, 14 May 2019 14:01:19 +0200
From: Petr Vorel <pvorel@suse.cz>
To: xuyang <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190514120119.GA26452@dell5510>
References: <1557732392-7049-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190513131451.GA22761@dell5510> <5CDA5124.3070708@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CDA5124.3070708@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] ltp-cap.m4: add libcap version detection && fix
 compiler error
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

SGkgWWFuZywKCj4gSGkgUGV0ZXIKCj4gICBJIHNlbnQgYSBtYWlsIHRvIHlvdSBsYXN0IEZyaWRh
eSBtZW50aW9uZWQgdGhpcyBwcm9ibGVtLgpOb3RpY2VkLCBiZWZvcmUgSSBmaW5kIGEgdGltZSB5
b3Ugc2VuZCBhIHBhdGNoLCBzbyBJIHJlcGxpZWQgdG8gaXQgKGl0J3MgYWx3YXlzCmJldHRlciB0
byBzZW5kIGEgcXVlc3Rpb24gaW4gcHVibGljKS4KCj4gQXQgdGhlIGJlZ2lubmluZywgSQo+ICAg
dGhpbmsgaXQgbWFrZXMgbm8gc2Vuc2UgYmVjYXVzZSBsaWJjYXAtMSBpcyB0b28gb2xkLiAgQnV0
IEkgbm90aWNlcyB0aGF0IGx0cC1xdW90YS5tNAo+ICAgaGFzIHF1b3RhX3YxIGFuZCBxdW90YV92
Mi4gSSBjaGFuZ2VzIG15IG1pbmQuCgo+ICAgU2luY2Ugd2UgaGF2ZSBkcm9wIGxpYm51bWEgdjEs
IEkgYWdyZWUgd2l0aCB5b3UgdGhhdCB3ZSBhbHNvIGRyb3AgbGliY2FwIHYxKHRvbyBvbGQpLgo+
ICAgQWxzbywgSSB0aGluayB3ZSBzaG91bGQgZHJvcCBxdW90YV92MSBiZWNhdXNlIGl0IGlzIHRv
byBvbGQgKHNpbmNlIExpbnV4IDIuNC4yMiwgUV9HRVRJTkZPIGhhcwo+ICAgYmVlbiBzdXBwb3J0
ZWQgaW4ga2VybmVsKS4KR29vZCBwb2ludC4gQnV0IEknbSBub3Qgc3VyZSBpZiBpdCdzIHRoZSBz
YW1lLCBhcyBRRk1UX1ZGU19PTEQgaXMgcGFydCBvZiBrZXJuZWwKc291cmNlIHRyZWUgKHBhcnQg
b2Yga2VybmVsIHNwYWNlIGNvZGUpIHNvIGl0IG1ha2VzIHNlbnNlIHRvIHRlc3QgaXQsIHdoZXJl
YXMKbGliY2FwIHYxIGFuZCBsaWJudW1hIHYxIGFyZSBqdXN0IG9sZCB2ZXJzaW9ucyBvZiB1c2Vy
IHNwYWNlIGxpYnJhcnkuCk9yIGFtIEkgd3Jvbmc/Cgo+IEtpbmQgUmVnYXJkcywKPiBZYW5nIFh1
CgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK
