Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 137402504B
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 15:29:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA1EF3EA70A
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 15:29:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E4CA43EA67C
 for <ltp@lists.linux.it>; Tue, 21 May 2019 15:29:38 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E677114019BB
 for <ltp@lists.linux.it>; Tue, 21 May 2019 15:29:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 10FE3AEC2;
 Tue, 21 May 2019 13:29:37 +0000 (UTC)
Date: Tue, 21 May 2019 15:29:36 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190521132936.GA19326@rei.lan>
References: <dc7300409a949189aa4ce9ef555405e36bdb50ab.1558426636.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc7300409a949189aa4ce9ef555405e36bdb50ab.1558426636.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: liwan@redhat.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] overcommit_memory: update for "mm: fix
 false-positive OVERCOMMIT_GUESS failures"
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

SGkhCj4gY29tbWl0IDhjNzgyOWIwNGM1MiAoIm1tOiBmaXggZmFsc2UtcG9zaXRpdmUgT1ZFUkNP
TU1JVF9HVUVTUyBmYWlsdXJlcyIpCj4gY2hhbmdlcyBsb2dpYyBvZiBfX3ZtX2Vub3VnaF9tZW1v
cnkoKSwgc2ltcGxpZnlpbmcgaXQgdG86Cj4gICAgIFdoZW4gaW4gR1VFU1MgbW9kZSwgY2F0Y2gg
d2lsZCBhbGxvY2F0aW9ucyBieSBjb21wYXJpbmcgdGhlaXIgcmVxdWVzdAo+ICAgICBzaXplIHRv
IHRvdGFsIGFtb3VudCBvZiByYW0gYW5kIHN3YXAgaW4gdGhlIHN5c3RlbS4KPiAKPiBUZXN0Y2Fz
ZSBjdXJyZW50bHkgYWxsb2NhdGVzIG1lbV90b3RhbCArIHN3YXBfdG90YWwsIHdoaWNoIGRvZXNu
J3QgdHJpZ2dlcgo+IG5ldyBjb25kaXRpb24uIE1ha2UgaXQgbW9yZSBleHRyZW1lLCBidXQgYXNz
dW1pbmcgZnJlZV90b3RhbCAvIDIgd2lsbCBQQVNTLAo+IGFuZCBzdW1fdG90YWwgKiAyIHdpbGwg
RkFJTC4KCkxvb2tzIGdvb2QsIGFja2VkLgoKLS0gCkN5cmlsIEhydWJpcwpjaHJ1YmlzQHN1c2Uu
Y3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5m
by9sdHAK
