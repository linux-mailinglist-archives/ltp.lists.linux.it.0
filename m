Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 031DE25BE65
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 11:24:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BBCBB3C2D78
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 11:24:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1BFAF3C2D16
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 11:24:22 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A3753600AA9
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 11:24:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 03E03AEB8;
 Thu,  3 Sep 2020 09:24:22 +0000 (UTC)
Date: Thu, 3 Sep 2020 11:24:48 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Cixi Geng <gengcixi@gmail.com>
Message-ID: <20200903092448.GC6285@yuki.lan>
References: <CAF12kFuE=4-T=eitwSb0F3fkGLLsmM3VEg4VNbioqJt2JiAEww@mail.gmail.com>
 <20200824074226.GB2466@yuki.lan>
 <CAF12kFvScxqxhY5wXTGL2RKnyM5vM0hEKDc+sHD-3Y=_C7FWcw@mail.gmail.com>
 <20200828130638.GD10501@yuki.lan>
 <CY4PR13MB11754F0072967B32B007D273FD520@CY4PR13MB1175.namprd13.prod.outlook.com>
 <CAF12kFspG2fQKUrA=HGWGQuHy=xJaL0gntqvksq+QmUK3mAdKw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF12kFspG2fQKUrA=HGWGQuHy=xJaL0gntqvksq+QmUK3mAdKw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC] ltp test add reboot function
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
Cc: Orson Zhai <orsonzhai@gmail.com>, xingfeng.kang@unisoc.com,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >Also I do consider the whole concept of running the test exectution
> >framework on the same machine as the testcases broken by desing for
> >kernel related tests. The way forward is the patchset send by Richard
> >that implements simple test executor that runs on the machine under test
> >and communicates with a execution framework that runs on a central
> >server.
> 
> I agree with some of your views??? the test architecture server/slave is most
> common test method. but I also want to know what kind of connection
> method between test machine and central server,  the ssh , adb or serial?
> 
> because my test machine is a cellphone, our purpose is test the kernel before
> androidOS , so I build debianOS on our haraware, and we can only used the
> serial port communicate with our testmachine.

As for LTP the tool Richard is working on is a daemon that runs on the
SUT[1], will be quite possibly started during the boot and will listen
on pre-defined transport channels, e.g. TCP, serial, bluetooth, etc. The
protocol itself should be transport agnostic and should work over
anything that can transport bytes. But that is something that is under
development at the moment.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
