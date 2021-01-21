Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C420F2FF042
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 17:30:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7AA713C871F
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 17:30:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B3B2F3C304A
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 17:30:18 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 72B2060095F
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 17:30:18 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C003EAB7A;
 Thu, 21 Jan 2021 16:30:17 +0000 (UTC)
Date: Thu, 21 Jan 2021 17:31:21 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Enji Cooper <yaneurabeya@gmail.com>
Message-ID: <YAmsWYlvIRI4P4Y+@yuki.lan>
References: <20210121102239.18643-1-pvorel@suse.cz>
 <1157B504-C0F4-421B-B91F-B58692D6A9C7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1157B504-C0F4-421B-B91F-B58692D6A9C7@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] configure.ac: More descriptive NUMA error
 message
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
Cc: Donghai Qiao <dqiao@redhat.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
In the end we pushed slightly different message:

https://github.com/linux-test-project/ltp/commit/2faab87c57be093114652d5dd684c33c7015dddc

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
