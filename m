Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1870732675C
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Feb 2021 20:21:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84D8E3C6FE0
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Feb 2021 20:21:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 6962A3C1DF8
 for <ltp@lists.linux.it>; Fri, 26 Feb 2021 20:20:59 +0100 (CET)
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com
 [185.132.183.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B5A6F60132B
 for <ltp@lists.linux.it>; Fri, 26 Feb 2021 20:20:56 +0100 (CET)
Received: from pps.filterd (m0209327.ppops.net [127.0.0.1])
 by mx08-001d1705.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11QJKsKr027650; Fri, 26 Feb 2021 19:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=S1;
 bh=IeGeYROA4G9hmqrslNET0t7jmKNB0KHCi1D9sXMeJyk=;
 b=e/wmViwJu74VtF0DtwQ+C8Zzp5yHiENgsI9OqYt1gSj+D/8SbUeEa9coQAMK35YIKhVG
 LScsBVAIF5xvIHnQ7V5OZffYlNxjAzhtw1FBE3NYihzG/m+BVSvbcOll0C3/9a++6YCx
 jDxpxRNhCJ9sVxMQXQT65Poi0rnTdTT3mlFZA7tJZ8c73a6uwM3sl4VSrIdd7J639KOo
 AHgTCl2skdcOo1Z9fMZjEm+mGNpfL0RPzqaecD+ShIrAcJq8cobEkb6cu7j4XYQonOwD
 6XoCJYLIf/3T2BhoazHdN6R7GmrILcaASOw7saziuJXMJsilVJQdiaSuLOpV7KOKfQ9H 7Q== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by mx08-001d1705.pphosted.com with ESMTP id 36tymfvgyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Feb 2021 19:20:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCilLi/KflXMrpMVbojdMsKvCBOk3f6Ain7FzcclFzZXuKgXuAFWICSyLTIfHD+RMuMpoN9p5yRRXFwyu6CW4RwlQycB8RZovnbaV9W0XG47WaSkRrJdu5vjjLPCS9YyOnfOZnZAyWx3dH61nif/pBSIliaMtfXb9loK5zURlgmKRQ8FKKIkbXuPZgi/K/mctiZKEWfmpM9oidIs6i+Qy0rMuzmU5jfPinc9wCAgkE4txz7mDV6vfeUYrnt2Fi1mKrEEBRX5ydw8SQT5V3J2+5obdrK0Lr5JbClLRB3IUDJ/5div3OSC64Gd0lDfsOpBKasM35V/PFw4rijBcFdzrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeGeYROA4G9hmqrslNET0t7jmKNB0KHCi1D9sXMeJyk=;
 b=chEC+PaTBY/Ej7mdwryQjcaYWc36mXyAm7Y8foLalvLhydtsDzoLWu7MOAf7lxIesefx+K5eeeUlcxEGg0GttWZrhxc/hT3VlTNyu184BIkheeogKQg9JqrYiqDAs8jBgcKUTayTBZ2s0b0mZ6guNysLqbgAlnp05UjGs/15CCylgN2fYbUCX4fl7zenbfCsJSPXpf7/6DBlDPrvjCC9/nK1wOUEzGxg3ziIVTDTHESCK1LLr2qfuvAoXqnbWXVlsq9TkMLiAWPQhBEYQlU3GPnYjxksbCPkvra9IUq81Eh9wm1RanvmKFrhclLrlXFMwipK0msJByhPQ/fuLSzSVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from BYAPR13MB2503.namprd13.prod.outlook.com (2603:10b6:a02:cd::33)
 by BY5PR13MB3189.namprd13.prod.outlook.com (2603:10b6:a03:182::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.11; Fri, 26 Feb
 2021 19:20:48 +0000
Received: from BYAPR13MB2503.namprd13.prod.outlook.com
 ([fe80::fc03:e7ea:5f35:ff45]) by BYAPR13MB2503.namprd13.prod.outlook.com
 ([fe80::fc03:e7ea:5f35:ff45%7]) with mapi id 15.20.3912.009; Fri, 26 Feb 2021
 19:20:48 +0000
From: <Tim.Bird@sony.com>
To: <chrubis@suse.cz>, <ltp@lists.linux.it>
Thread-Topic: [Automated-testing] [PATCH v2 0/5] Another attempt at hardware
 discovery
Thread-Index: AQHXCs0HxzuiIOdXb0WgZ8DoG6pdZKpqx98A
Date: Fri, 26 Feb 2021 19:20:48 +0000
Message-ID: <BYAPR13MB2503F63EE761C8A8FC98E3DDFD9D9@BYAPR13MB2503.namprd13.prod.outlook.com>
References: <20210224165045.17738-1-chrubis@suse.cz>
In-Reply-To: <20210224165045.17738-1-chrubis@suse.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=sony.com;
x-originating-ip: [136.175.96.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ecc787b6-e9c6-41d9-d71d-08d8da8b9f61
x-ms-traffictypediagnostic: BY5PR13MB3189:
x-microsoft-antispam-prvs: <BY5PR13MB31894695CC871826835D0106FD9D9@BY5PR13MB3189.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cWEAnEk3gugNjaplpGJ20D42UTPSV9C94041VRnif6r2ZJ+k3pLRNZoNz6prH5oGDrsvLpEWG4QVAD3E5KMt1Wrm29orzVoouP4WqMo3QFH3o6sOJHmCDFeufABQTRw6c8Z0qqscbR8O53RPu5VgCu4uPMSzHtfJM/9hOQh7P/9ZVpv0p5bWPu0qFPRHYo7MzIi1vAD8jKYeqArA7BkVks+YwyP4Xz9PPpnKJ7tGSCIzyJWMcmd3WriM5k3bgge1qVn6YlG3ATvgqHz7KRzWJOBxZ2RtqljYar1+vMPYAa2kurhwPf+9iKz5sOL6OSQtiLRDAGtpDU69TdYid8Sv3b1j0Pcc42moOg+dJqed9hRRssjFjDt/DIpNg6aaVAkBndDgqycBAFvCpfS1tyvSjDDpenXHYZEBn6IJmD8RyvfTbSsQwn+JeVffY8PY+W+7EKy+DtpWCGhw+aIJfl2FTmsTIoqJLSHXzCiw1K5P6HCzeQqScX3hjfmfne/xBulU93Zge76L+f3dp7CNb9aIPA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR13MB2503.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(8676002)(8936002)(83380400001)(64756008)(478600001)(5660300002)(71200400001)(66946007)(33656002)(66476007)(2906002)(186003)(4326008)(26005)(86362001)(9686003)(55016002)(316002)(110136005)(52536014)(6506007)(7696005)(66556008)(66446008)(54906003)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?HmCAVGxK1p2Y8wfVLvX1EuTE5OOg1CGcXG00TUmgFi8yPPxOMm5CGc2N1YGn?=
 =?us-ascii?Q?50zFvstaAJyZokHb+oSA/nLSLXCkrlJJKGZ5o/TpGf7Qh9EbEFfvue1Syfpz?=
 =?us-ascii?Q?CJPsg1uIuHJd5NH5Jp3KQou6DwGqOHmspJHyycTfibeR8V3QHk6ErDJwhFkn?=
 =?us-ascii?Q?u2UfdYlynhGM2lREUJO4JF766etJ5CfdarMocOJF0JOl6hJB5bBqKvANBzp2?=
 =?us-ascii?Q?2EEAMjaUaA1aIieOMFv2mC9qh7Z6krRy/kY68zqgDv09YuCjODhipaoZTlaO?=
 =?us-ascii?Q?Xh2eE0J8rCnSmsfyULlzee5npq6kMa6WMxHkdRGKNwhWBWlrAsCMnOl+e0jt?=
 =?us-ascii?Q?x50vcgbq4uEqbDGWmD5QJxGP7tXC+GLkbnvIb6CUpos2xLC9BuE0Y9MhZd3D?=
 =?us-ascii?Q?VWdHaDDN1Fdha/shGfdxnP0m1z985QBifDP5EnIQzraxYVrXHOWvHqbI5BdA?=
 =?us-ascii?Q?WQ/HCncTfPNSVtw1qZbf6oPm+5MZU4EF/c0hahR91GJqp6kIua/PC/HVyMxl?=
 =?us-ascii?Q?kUCaFTV/nWlWiK1DZfUjNMLX7uv0HHsOR0FLAU5aLI4taioh5/YMYu1849nC?=
 =?us-ascii?Q?k7dE5waSRRtqK911w0rvkJIeQoTPa0VNHRGf9BsYX+gMAS6Aqnb2Y7iWg/ow?=
 =?us-ascii?Q?5PcNrJ+EnwJwyvW476WaEiAZI1KdKwaaiYX1wcQdNuN00/sQ5C6tj69lRZHY?=
 =?us-ascii?Q?ypmtfoARBw67tK8HA9k1qIswae4vE1PHRQDLWEDzPawwWdbT2r2xnfQgoCcE?=
 =?us-ascii?Q?KPFgwEKwcXLxg6hWKE8PojfCU8gxUPYdP0zreu1A1+LkSt9Rb+PxauE3aTbs?=
 =?us-ascii?Q?FZGGqJQXBk3S3RnzPDnL3kJPgt8Fl1bqpatzvJlgxQ4jrSr3NDQ+8yJAJ3Im?=
 =?us-ascii?Q?i60XEQM1gEjNQeSLp/dnsrzQzD8nsbDVuDZuoXygxD2JLqrHoGiRaFvH4Whx?=
 =?us-ascii?Q?6VqwPT8qsAlp4qxREq3BuzxtQ/bvAd5xHDrRakvui+vEm9eFLBSiTojEdUyt?=
 =?us-ascii?Q?jdMBzIk4nl4ZnJ7MghY8ilg5OeVJIwBDofWtfD67bpI0vu1JmEbeNjh1/Zdx?=
 =?us-ascii?Q?q66ibHqTCn6O71vOGRvSKFbPKp0Tb82zGzBnlpYbpQceoQyW9J6hGaaKp49C?=
 =?us-ascii?Q?XRKKQ/XsrFLmHL2zIwCEQKT1nS0KutOdIkvTLI5azBHm7lK1PSn4KRGGMXSp?=
 =?us-ascii?Q?SAEKP5L6jiYNIwraw7xsVbdnGJUv7bDN9rELnlGus0znFr9hMwk34p/WsNAP?=
 =?us-ascii?Q?O/e0nWfpGXwTeTdmUkz6XtmnYSyIE9EnLLdcxpqhcfldMnbknRJXbeoa021y?=
 =?us-ascii?Q?v7uGMfjwfDO4Vnsz3Iyw0qSX?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR13MB2503.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc787b6-e9c6-41d9-d71d-08d8da8b9f61
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2021 19:20:48.1144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rSVsgLQ6PVXGLFFiuCgp2kIBlSvyj4QXR69V+IzGNYCE5us26TiHeeCQ7V2yQjRn2+fncbwI4HTLTzaYaDNPiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB3189
X-Sony-Outbound-GUID: Ckb_GkEYHmJ3eEr-HaQMwoBhgmB0c5WN
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-26_07:2021-02-26,
 2021-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 adultscore=0 clxscore=1031 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102260141
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [Automated-testing] [PATCH v2 0/5] Another attempt at
 hardware discovery
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
Cc: michals@xilinx.com, ceh@ti.com, automated-testing@yoctoproject.org,
 orsonzhai@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Here are some questions and feedback on the proposal.

> -----Original Message-----
> From: automated-testing@lists.yoctoproject.org <automated-testing@lists.yoctoproject.org> On Behalf Of Cyril Hrubis
> 
> This is a second attempt on hardware discovery LTP support. The main
> difference between the previous attempts is that this version uses JSON,
> which allows us propagate structured data to the test.

JSON seems like a good choice.  In my experience, if a test is written
in a language where json-handling is not easy (e.g. shell scripts), there
are options for dealing with this.  For example, you could require 'jq'
on the system where the shell script runs.  It's not that bad of a dependency
IMHO.

> 
> This is still an early protototype but I'm sending it out to get more
> feedback before I continue to work on it.
> 
> So how is this supposed to work:
> 
> * Test that needs particular hardware sets the needs_hardware filed in
>   the test test structure. This is a free form string, in the uart
>   example it's called 'UART-loopback'. If we ever add a test for i2c
>   eeprom it would be probably called 'I2C-eeprom', etc.

Sounds good.  It will be good to standardize on these strings
in the long run.  For now, just picking strings and trying to reconcile
them later seems OK.

> 
> * The test library takes this and passes it to the hardware discovery
>   script/binary.

This is probably in the patch set, but how is this invoked?
Does the script have a well-known name or location?

> The example script that is included in this patchset
>   just hardcodes configuration for a usb-to-serial cable. In real world
>   lab this would be either prepared for each board specifically and
>   injected to the filesystem before the test happens, or may be a simple
>   script that calls curl with a request to a lab sever, etc.

Either of these seem like workable approaches.  In the case of
injecting it into the filesystem, do you have any
ideas where you would inject these?  For example,
would they go somewhere under /etc, or in /usr/test/conf?

Is this something that only the hardware discovery program
needs to know?  Or do tests use this data directly?

This seems like a rendezvous point between
the hardware discovery program and the lab management
system, so IMHO it should be well-defined.

> 
> * The output from the script is a JSON object. If there is a need to
>   reconfigure lab hardware before the test, the JSON contains a path to
>   a script/binary that has to be called to do so.

That's interesting.

> Again this may be a
>   script that calls curl with a request to a lab sever which would, for
>   example, interconnect different serial ports with relays.
> 
>   The parameter to that script is an unique ID for the hardware
>   configuration that is listed in each hardware configuration in the
>   hwconfs array of objects that follows.
> 
>   I'm not sure if this actually belongs there, maybe it would be
>   cleaner to have one reconfigure script for the whole LTP and we would
>   pass the needs_hardware content as well as the unique ID, e.g.
> 
>   'hardware-reconfigure.sh UART-loopback ttyUSB0-ttyS0'
> 
>   but that is a minor detail that could be easily sorted out later.
> 
> 
>   The most important part of the JSON is the hwconfs array, which
>   consists of hardware description objects, which, apart form the uid,
>   are not interpreted by the library, but rather passed to the test. The
>   test library loops over the array and forks a testrun for each entry
>   in the array.
> 
>   Each iteration of the test then gets it's parameters as a JSON object.
>   In the case of the UART one of the objects in the array looks like:
> 
>   {
>     "uid": "ttyUSB0-ttyUSB0-01",
>     "rx": "ttyUSB0",
>     "tx": "ttyUSB0",
>     "hwflow": 0,
>     "baud_rates": [
>      9600,
>      19200
>     ]
>   }
> 
>   Which is mostly self-explanatory, the test then parses the structure
>   and executes one test per each baud rate.
> 
>   What is still missing is the ability to pass the JSON hardware
>   description directly to the test, so that we can execute the test
>   manually, but that would be fairly easy to add.

OK - let me describe what I had in mind for a test where the serial
port was not in loopback mode, to see how it relates to the proposed
architecture.  The gpio version of this is implemented in the board
farm REST API, but the serial port testing version of this is still
under consideration:

Here's how the test would work, for a serial port transmission test where
the transmitting side of the serial line was on the DUT and the other side was
managed by the lab hardware:
 - 1) the test discovers the hardware for DUT endpoint of the serial line
    using the hardware discovery program
 - 2) the test discovers the hardware for the lab endpoint (receiving end)
    of the serial line using the hardware discovery program
 - 3) the test discovers the available baud rates from the hardware discovery
    program
 - 4) the test configures the lab endpoint for reception
 - 5) the test configures the DUT endpoint for transmission
 - 6) the test loops over the baud rate values, doing the following (7-13):
    - 7) use a curl interface or local program to set the receive baud rate of the lab endpoint
    - 8) use a curl interface or local program to request serial capture of the lab endpoint
    - 9) configure the baud rate of the DUT endpoint
    - 10) send data through the DUT endpoint
    - 11) use a curl interface or local program to cause the lab endpoint to stop capturing data
    - 12) use a curl interface or local program to request the capture data from the lab endpoint
    - 13) compare data that was received with the data that was intended to be transmitted

These roles could also be reversed (ie, have the lab endpoint be the sender
and the DUT endpoint be the receiver).

The process of configuring the baud rate seems like it corresponds
with the hardware_reconfigure.sh script.  But maybe you were only
thinking of have this actually set up physical connections, and not
manage connection/bus settings.

In any event, maybe the hardware_reconfigure.sh script could know
about 'start data capture', 'stop data capture', and 'get captured data'
operations, or maybe this should be a separate script.

This is structured in a generic way, because I think different tests
(such as audio testing, video testing, power measurement testing,
CAN bus testing, i2C testing, gpio testing, etc. can all be fit into this
model of testing by:
  discovering bus endpoints, configuring bus parameters,
  transmitting or generating data, capturing data
  comparing data

So far, I don't see anything in LTP proposal that precludes this model of testing.
There may be more to add - either extending hardware_reconfigure.sh
or adding a new command that a test would use interactively to
cause data to be exchanged and allow it to be compared.

So - it looks good to me!
 -- Tim

> 
> Cyril Hrubis (5):
>   lib: tst_cmd: Make tst_cmd() usable for global paths
>   lib: Add minimalistic json parser
>   lib: Add hardware discovery code
>   Sample hardware discovery and reconfigure scripts
>   testcases: uart01: Add.
> 
>  hardware-discovery.sh                         |  36 +
>  hardware-reconfigure.sh                       |   3 +
>  include/tst_hwconf.h                          |  13 +
>  include/tst_json.h                            | 177 +++++
>  include/tst_test.h                            |   3 +
>  lib/tst_cmd.c                                 |   2 +-
>  lib/tst_hardware.c                            | 218 ++++++
>  lib/tst_hardware.h                            |  83 +++
>  lib/tst_json.c                                | 679 ++++++++++++++++++
>  lib/tst_test.c                                |  30 +
>  runtest/device_drivers                        |   2 +
>  testcases/kernel/device-drivers/Makefile      |   1 +
>  .../kernel/device-drivers/uart/.gitignore     |   1 +
>  testcases/kernel/device-drivers/uart/Makefile |   3 +
>  testcases/kernel/device-drivers/uart/uart01.c | 620 ++++++++++++++++
>  15 files changed, 1870 insertions(+), 1 deletion(-)
>  create mode 100755 hardware-discovery.sh
>  create mode 100755 hardware-reconfigure.sh
>  create mode 100644 include/tst_hwconf.h
>  create mode 100644 include/tst_json.h
>  create mode 100644 lib/tst_hardware.c
>  create mode 100644 lib/tst_hardware.h
>  create mode 100644 lib/tst_json.c
>  create mode 100644 runtest/device_drivers
>  create mode 100644 testcases/kernel/device-drivers/uart/.gitignore
>  create mode 100644 testcases/kernel/device-drivers/uart/Makefile
>  create mode 100644 testcases/kernel/device-drivers/uart/uart01.c
> 
> --
> 2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
