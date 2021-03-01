Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EE2327F57
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 14:23:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3B903C6E8F
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 14:23:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 33BC93C3157
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 14:23:00 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B5B121000913
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 14:22:59 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EDA5CAC24;
 Mon,  1 Mar 2021 13:22:58 +0000 (UTC)
Date: Mon, 1 Mar 2021 14:24:30 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Cixi Geng <gengcixi@gmail.com>
Message-ID: <YDzrDqn0eLkdBLZd@yuki.lan>
References: <20210224165045.17738-1-chrubis@suse.cz>
 <CAF12kFtuFvVnykBbcGsgsc_LYuh541SfA9P_RV88KzwFjuTsxg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF12kFtuFvVnykBbcGsgsc_LYuh541SfA9P_RV88KzwFjuTsxg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 0/5] Another attempt at hardware discovery
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
Cc: Carlos Hernandez <ceh@ti.com>, Michal Simek <michals@xilinx.com>,
 automated-testing@yoctoproject.org, Orson Zhai <orsonzhai@gmail.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I think this has many advantages over the first edition, In out Internal Test???
> we use a similar way to define the test prerequires as JSON structor.[1]
> here is My opinion, In the LTP testcase framework, we can set all the
> prerequires
> in a JSONfile, these prerquires include CONFIGS,  ABIs,
> devices-path(sys???proc,dev etc.),
> the SETUP stage  to check if the machine satisfy the defined-Json.
> at the same time??? we also need a scripts to generate a JSON-file from
> the current machine to collect all the prerequires list.
> In this way, the benefit not just device-driver, but alse common testcase

We actually have something like this implemented. We generate a big JSON
file on LTP build that describes the whole testsuite, but it includes
more than just pre-requisites, have a look at docparse/metadata.json
that is generated in recent LTP builds.

As for kernel config dependencies we have needs_kconfigs array, which is
actually an array of boolean expressions on kernel config options where
each of them has to be true in order for a test to continue. So to find
out if we have a suitable kernel config for a test we have to check if
all are true in:

"tests": {
	"test_name": {
		"needs_kconfigs": [
			"CONFIG_FOO=y | CONFIG_BAR=m",
			"!CONFIG_DAR=y"
		]
	}
}

We do not have the "file" part that would match the functionality you
have in your code but that shouldn't be hard to add.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
