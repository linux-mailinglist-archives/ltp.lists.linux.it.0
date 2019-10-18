Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D04D2DBF3A
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 10:02:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 557223C229E
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 10:02:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8B5E43C1CB0
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 10:02:15 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 10CCE600FD7
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 10:02:14 +0200 (CEST)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id DAEDB9F64C;
 Fri, 18 Oct 2019 08:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1571385734; bh=N5mRdGITC+44Wom1GkmMUXjR1YApUt0SabghsIcs+GY=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=WF/vL+L94FkWIeYsSdVkhb++LgrHnwQAOXgO5HR8z59JJT6hBkc/y+2oxis+kuNv0
 BSeMhCpGWg01u90o8HUMLvt+LSMhLYPKM6fZ3Q9KF0yypButcPk1WIV2D7SgbJmsU9
 FUsBNLg0C8sDCoXxpN46to71aNxdIN5d0FMOhQ+8=
To: Jan Stancek <jstancek@redhat.com>, Cyril Hrubis <chrubis@suse.cz>
References: <77c71c80-0ca2-6f67-d628-d337a13539d7@jv-coder.de>
 <81c89bbde27ede0ef4291df60186bdcd293a3db5.1571219422.git.jstancek@redhat.com>
 <20191017125442.GB31415@rei.lan>
 <908344166.6934710.1571385536128.JavaMail.zimbra@redhat.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <a14f1623-7552-793b-c5e6-7ef48c53a983@jv-coder.de>
Date: Fri, 18 Oct 2019 10:02:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <908344166.6934710.1571385536128.JavaMail.zimbra@redhat.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] timer_getoverrun/2-3: increase tolerance for
 overshoot
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
Cc: ltp@lists.linux.it, joerg vehlow <joerg.vehlow@aox-tech.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpBbSAxOC4xMC4yMDE5IHVtIDA5OjU4IHNjaHJpZWIgSmFuIFN0YW5jZWs6Cj4gLS0tLS0g
T3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+PiBIaSEKPj4gSSB3b25kZXIgaWYgd2UgY2FuIG1lYXN1
cmUgdGhlIHNsZWVwIHdpdGggbW9ub3RvbmljIGNsb2NrLCB0aGVuIHdlIGNhbgo+PiBiZSBtb3Jl
IHByZWNpc2UsIHNpbmNlIHdlIHdvdWxkIGtub3cgaG93IG11Y2ggd2Ugb3ZlcnNob290LiBCdXQg
aXQncwo+PiBwcm9iYWJseSBub3Qgd29ydGggb2YgY29tcGxpY2F0aW5nIHRoZSBjb2RlLgo+Pgo+
PiBFaXRoZXIgd2F5IEknbSBmaW5lIHdpdGggdGhpcyB2ZXJzaW9uIGFzIHdlbGwsIGFja2VkLgo+
IEkgcHVzaGVkIGN1cnJlbnQgcGF0Y2guIElmIHdlIGZpbmQgaXQncyBzdGlsbCBjYXVzaW5nIGlz
c3Vlcwo+IEknbGwgbG9vayBpbnRvIHRoZSBpZGVhIHdpdGggbW9ub3RvbmljIGNsb2NrLgo+ClRo
YW5rcyBmb3IgZml4aW5nIHRoaXMuIEknZCBsaWtlIHRvIG1lbnRpb24sIHRoYXQgQ0xPQ0tfTU9O
T1RPTklDIGlzIGFuCm9wdGlvbmFsZmVhdHVyZSBpbiBwb3NpeC4gSSBkbyBub3Qga25vdyBpZiB0
aGVyZSBhcmUgc3lzdGVtcyBtaXNzaW5nIGl0LAp0aGF0IG1pZ2h0IHJ1biB0aGVzZSB0ZXN0LgoK
SsO2cmcKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
