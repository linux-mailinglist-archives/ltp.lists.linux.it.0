Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 370FC3AACC9
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 08:56:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 972C43C88CD
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 08:56:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 51C413C2DCB
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 08:56:09 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 50DE21A01235
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 08:56:08 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 6B0D99F72D;
 Thu, 17 Jun 2021 06:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1623912965; bh=bWzXLwpUMxdkBpPsqHWFf0vcS8jhaPWXuALQ4njbEUs=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=FDGpn7r9U+p8rH34+6xEYoA1mO6jXQ5eMxhXqXmtGeVNT7s1LMDt7hTeRz7ZxiNdh
 FSbcyu4ckl2CadwhwIp7t4Lh+j/4QfcecU6E0bMPUyd03VeGeuLmBALaPXhAKAgUmQ
 0SvjoKqkkApiUwvVlAjNduwS6dFv+RPqCeFNoMJo=
To: Petr Vorel <pvorel@suse.cz>
References: <20210616081856.3026223-1-lkml@jv-coder.de>
 <YMrbQPcfS9xFOBpO@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <38b6582d-fdfa-b661-27f9-bdcd2962b96b@jv-coder.de>
Date: Thu, 17 Jun 2021 08:56:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMrbQPcfS9xFOBpO@pevik>
Content-Language: en-US
X-Spam-Status: No, score=-0.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3] ssh-stress: Convert to new api
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUGV0ciwKCgoKT24gNi8xNy8yMDIxIDc6MTggQU0sIFBldHIgVm9yZWwgd3JvdGU6Cj4gSGkg
Sm9lcmcsIEFsZXhleSwKPgo+IG1lcmdlZCEgVGhhbmtzIGJvdGggZm9yIHlvdXIgdGltZS4KdGhh
bmtzLCBidXQgeW91IHNob3VsZCBoYXZlIHJlbW92ZWQgbXkgImNoYW5nZXMgaW4gdjMiIGZyb20g
dGhlIGNvbW1pdCAKbWVzc2FnZSA6KQpXYXMgSSBzdXBwb3NlZCB0byBwbGFjZSBzdHVmZiBsaWtl
IHRoYXQgc29tZXdoZXJlIGVsc2UgaW4gdGhlIG1haWwsIHRvIApwcmV2ZW50IGl0IGZyb20gYmVp
bmcgbWVyZ2VkPwoKSsO2cmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5s
aW51eC5pdC9saXN0aW5mby9sdHAK
