Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A133E58EB
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 13:15:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 61B5A3C70C0
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 13:15:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9CA7D3C0CFD
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 13:15:32 +0200 (CEST)
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 81E48200BCA
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 13:15:29 +0200 (CEST)
X-QQ-mid: bizesmtp50t1628594123tz6el7cf
Received: from [10.4.23.46] (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 10 Aug 2021 19:15:22 +0800 (CST)
X-QQ-SSF: 0040000000200040B000000A0000000
X-QQ-FEAT: yN/ROybvCA4MG9PYewoCdKDs58MfkiheJ8eCekyfLmmBEcwV7Dcq5Q1L1t067
 LsBOq3EGNYayuHZFXziMd6A8Bd2+rAvmqjksfirP9ByF1V3diSdsjIKO5lSm7daRceu1aJm
 /1OG7tWrsBDI4l5w5nXtIHCE1dvA2Ul0kx1ARmIOBm3dD4v4HsrekIbzNyExzjrdJQ8H/1f
 cXeKpGqUSSUwRbMl1KIh4ClBCWNtbhmvLazxrZyfOHH/ud1IqKuN2dhE6iqbPppFRLUJ5Hm
 7BStBzPGKH8IxxxvQFXUIgC3bt1PUdAiDlsQX1C+IrOAJzU0VbHfV5aYF0nd8619a1Kmakr
 irp7aak
X-QQ-GoodBg: 2
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210806072338.8240-1-zhanglianjie@uniontech.com>
 <YRJRQUSJJHjwNNZy@yuki> <YRJfAXd3mryUhH0+@yuki>
From: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <cd370a80-fe1d-4e05-2c11-344d98fd5874@uniontech.com>+C0073C4C90C51FD8
Date: Tue, 10 Aug 2021 19:15:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YRJfAXd3mryUhH0+@yuki>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.8 required=7.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] syscalls/chmod01: Convert to new API
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T0ssIHRoYW5rc++8gQoKT24gMjAyMS0wOC0xMCAxOToxMiwgQ3lyaWwgSHJ1YmlzIHdyb3RlOgo+
IEhpIQo+IEl0IG1heSBiZSBhbHNvIGEgZ29vZCBpZGVhIHRvIGFkZCBkaXJlY3RvcnkgdGVzdHMg
dG8gdGhlIHRlc3RjYXNlIGFzCj4gd2VsbC4KPiAKCi0tIApSZWdhcmRzLApaaGFuZyBMaWFuamll
CgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5m
by9sdHAK
